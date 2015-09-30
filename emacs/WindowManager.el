;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ***** Buffer Mgmt. ***** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (defun better-display-buffer(arg)
   "a better display buffer"
  (interactive "B")
  (let ((b (current-buffer)))
    (switch-to-buffer-other-window arg)
    (switch-to-buffer-other-window b)))


(defun find-and-display-file (FILENAME)
  "this finds file and displays it in other window without selecting it"
  (interactive "FFind and display file: ")
  (let ((buf (find-file-noselect FILENAME)))
    (better-display-buffer buf)))


(defun list-and-display-directory (dirname &optional switches)
  "this finds dired listing and displays it in other window without selecting it"
  (interactive (progn (require 'dired)	;; why doesn't autoload work?
		      (dired-read-dir-and-switches "")))
  (better-display-buffer (dired-noselect dirname switches)))


(defun sink-buffer()
"bury the current buffer, and delete the window!"
  (interactive)
  (let ((foo (buffer-name)))
    (bury-buffer)
    (message (concat "Buried " foo))
    (if (not (= (count-windows) 1))
	(delete-window))))


(defun kill-current-buffer ()
  (interactive)
  (if (buffer-modified-p)
      ;(error "Can't kill current buffer, buffer modified.")
    (kill-buffer (current-buffer))))


(defun kill-other-buffer ()
  "kill a buffer other than the current one, and stay in current buffer"
  (interactive)
  (with-current-buffer (window-buffer (next-window))
    (let* ((lst (mapcar (lambda (a)
			  (cons (buffer-name a) a))
			(buffer-list))))
      (kill-buffer
       (let* ((ded-buf (completing-read 
			(concat
			 "Kill (" (buffer-name) "):")
			lst nil t nil))
	      (real-ded (if (equal "" ded-buf)
			    (buffer-name)
			  ded-buf)))
	 real-ded)))))



(defun switch-windows-with-buffer (to)
  "switches current buffer position with 'to'.  this doesn't work right if
more than 2 windows are currently displayed."
  (let ((buf (current-buffer)))
    (switch-to-buffer to)
    (switch-to-buffer-other-window buf)))



(defun flip-windows ()
  "flip positions of this window and the next-window"
  (interactive)
  "flip the current buffer and another's placement in the window"
  (let* ((nextw (next-window))
	 (tot (count-windows)))
    (cond
     ((< tot 2) (error "%s" "Not enough windows to flip"))
     ((= tot 2) (funcall 'switch-windows-with-buffer (window-buffer (next-window))))
     (t (switch-windows-with-buffer
	 (let* ((buf (window-buffer nextw))
		(name (buffer-name buf))
		(ded-buf
		 (completing-read 
		  (concat "Flip with (" name "): ")
		  (mapcar (lambda (a)
			 (cons (buffer-name a) a))
		       (buffer-list))
		  nil t nil)))
	   (if (equal "" ded-buf)
	       name
	     ded-buf)))))))


(defun alternate-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun alternate-buffer-in-other-window ()
  (interactive)
  (better-display-buffer (other-buffer)))


;--------------------------------------------------
; This is for jumping easily to commonly used buffers.


(defvar common-buffers '(("l" . "*shell*")
			 ("s" . "*scratch*")
			 ("c" . "*compilation*"))
  "This is the alist of codes to buffer names for use in switch-to-common-buffer")


;; tweaked to work with shell-current-directory.el
(defun switch-to-common-buffer (buf-id)
  "Jump-to-existing-buffer with name corresponding to buf-id in
common-buffers alist"
  ;; TODO: build the string of options from the items in common-buffers
  (interactive "cSwitch to indexed buffer (lsc): ")

  (if (string= (char-to-string buf-id) "l")
      (let ((buff (directory-shell-buffer-name)))
	(if (get-buffer buff)
	    (progn 
	      (message buff)
	      (setq shell-last-shell buff)
	      (jump-to-existing-buffer (get-buffer buff))
	      )
	  (if (and shell-last-shell (get-buffer shell-last-shell))
	      (jump-to-existing-buffer shell-last-shell)
	    (error "no shell for current directory"))))
    (let* ((entry (assoc (char-to-string buf-id)
			 (filter '(lambda (i)
				    (get-buffer (cdr i)))
				 common-buffers)))
	   (bufname (and entry (cdr entry))))
      (if bufname
	  (jump-to-existing-buffer bufname)
	(error "Selection not available")))))


(defun jump-to-existing-buffer (bufname)
  "Jump to buffer BUFNAME.  If visible go there.  Otherwise make it visible
and go there."
  (let ((buf (get-buffer bufname)))
    (if buf
	(cond
	 ((equal buf (current-buffer)) t)
	 ((get-buffer-window buf t)
	  (let ((win (select-window (get-buffer-window buf t))))
	    (select-frame (window-frame win))
	    (other-frame 0) ; switch to the selected frame?
	    (select-window win)))
	 ((equal (count-windows) 1)
	  (switch-to-buffer-other-window buf))
	 (t (switch-to-buffer bufname))))))


;; modifications of shell-current-directory.el by Daniel Polani
(defun directory-shell-buffer-name ()
  "The name of a shell buffer pertaining to DIR."
  (interactive)
  (concat "*"
	  (directory-file-name (expand-file-name default-directory))
	  "-shell*"))

(defvar shell-last-shell nil)

(defun shell-current-directory ()

  "Create a shell pertaining to the current directory."

  (interactive)
  (let ((shell-buffer-name (directory-shell-buffer-name)))
    (setq shell-last-shell shell-buffer-name)
    (if (get-buffer shell-buffer-name)
	(jump-to-existing-buffer shell-buffer-name)
      (shell)
      (rename-buffer (directory-shell-buffer-name) t))))





(require 'advice)
;-----------------------------------------------------------------------------
;i stole this stuff from eric beuscher.  i'm sick of creating buffers on
;accident, and then having to kill them!

(defadvice switch-to-buffer 
  (before existing-buffers-only activate)
  "When called interactively switch to existing buffers only, unless 
when called with a prefix argument."
  (interactive 
   (list (read-buffer "Switch to buffer: " (other-buffer) 
                      (null current-prefix-arg)))))

(defadvice switch-to-buffer-other-window 
  (before existing-buffers-only activate)
  "When called interactively switch to existing buffers only, unless 
when called with a prefix argument."
  (interactive 
   (list (read-buffer "Switch to buffer other window: " (other-buffer) 
                      (null current-prefix-arg)))))

(defadvice better-display-buffer 
  (before existing-buffers-only activate)
  "When called interactively display existing buffers only, unless 
when called with a prefix argument."
  (interactive 
   (list (read-buffer "Display buffer: " (other-buffer) 
                      (null current-prefix-arg)))))

(defadvice display-buffer (around  display-buffer-return-to-sender activate)
  "displaying a buffer in another frame should not change the frame we are currently in!"
  (let ((f (window-frame (selected-window))))
    ad-do-it
    (raise-frame f)))

;; Kills Compile buffer after 1 sec if no errors
(setq compilation-finish-function
  (lambda (buf str)
    (if (null (string-match ".*exited abnormally.*" str))
        ;;no errors, make the compilation window go away in a few seconds
        (progn
          (run-at-time
           "1 sec" nil 'delete-windows-on
           (get-buffer-create "*compilation*"))
          (message "No Compilation Errors!")))))

(defun jump-to-existing-buffer (bufname)
  "Jump to buffer BUFNAME.  If visible go there.  Otherwise make it visible
and go there."
  (let ((buf (get-buffer bufname)))
    (if buf
	(cond
	 ((equal buf (current-buffer)) t)
	 ((get-buffer-window buf t)
	  (let ((win (select-window (get-buffer-window buf t))))
	    (select-frame (window-frame win))
	    (other-frame 0) ; switch to the selected frame?
	    (select-window win)))
	 ((equal (count-windows) 1)
	  (switch-to-buffer-other-window buf))
	 (t (switch-to-buffer bufname))))))


;; modifications of shell-current-directory.el by Daniel Polani
(defun directory-shell-buffer-name ()
  "The name of a shell buffer pertaining to DIR."
  (interactive)
  (concat "*"
	  (directory-file-name (expand-file-name default-directory))
	  "-shell*"))

(defvar shell-last-shell nil)

(defun shell-current-directory ()

  "Create a shell pertaining to the current directory."

  (interactive)
  (let ((shell-buffer-name (directory-shell-buffer-name)))
    (setq shell-last-shell shell-buffer-name)
    (if (get-buffer shell-buffer-name)
	(jump-to-existing-buffer shell-buffer-name)
      (shell)
       (rename-buffer (directory-shell-buffer-name) t))))
