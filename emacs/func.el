;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******* Functions Found/Created ******** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Backward line deletion
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; Easier Sudo Command 
(defun sudo-find-file (file-name)
  "Like find file, but opens the file as root."
  (interactive "FSudo Find File: ")
  (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
    (find-file tramp-file-name)))

;; Open Current Buffer as Root
(defun sudo-current-file ()
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
	     buffer-file-name))))

;; Easier Tramp Command 
(defun start-tramp ()
  (interactive)
  (let ((tramp-conn (read-from-minibuffer "Enter tramp connection: "))) 
    (find-alternate-file (concat "/ssh:" tramp-conn))))

(defun make-compile()
  (interactive)
  (beginning-of-buffer)
  (newline)
  (previous-line)
  (let ((compile-var (read-from-minibuffer "Enter compile-command: ")))
    (insert  "-*- compile-command: \"" compile-var "\" -*-"))
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-region beg end))
  (end-of-line)
  (newline)
  (save-buffer)
  (interactive)
  (revert-buffer t t))

;; (defun iTunes-control ()
;;   (interactive)
;;   (let ((file (do-applescript "try
