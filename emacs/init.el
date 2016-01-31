;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *******  ~/.emacs.d/init. ******* ;;
;; For various things like:          ;;
;; - Personal settings,	             ;;
;; - Mode-hooks,	             ;;
;; - And various hacks. 	     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *** Loads other configs *** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook
	  '(lambda() 
	     (load "~/.emacs.d/packmode.el")
	     (load "~/.emacs.d/functions.el")
	     (load "~/.emacs.d/intel-mode.el")
	     (load "~/.emacs.d/key-maps.el")
	     (load "~/.emacs.d/mac.el")))

(setq custom-enabled-themes (load-file "~/.emacs.d/theme.el"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *****  Personal Settings ***** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The good stuff!
(setq hostname "moonbase7") 
(setq header-user-name "Conner Stephens")
(setq header-email "fsf291@mocs.utc.edu")
(setq erc-nick "OxADD1DEAD")

;; Sets Default Window Size!
(setq initial-frame-alist '((width . 86) (height . 55)))
(setq ring-bell-function 'ignore)

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; gui-tweaks
(show-paren-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(transient-mark-mode 0)

;; Enables kbd for making upper/lower case
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Shell / Eshell stuff
(setq comint-process-echoes t) ;; stops eshell from repeating commands 
(ansi-color-for-comint-mode-on) ;;
(global-font-lock-mode t)

;; Auto save and back-ups
;; Turn off backup for sudo files
(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not
              (let ((method (file-remote-p name 'method)))
                (when (stringp method)
                  (member method '("su" "sudo"))))))))

; Where to back up!
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

; Backups for tramp
(setq tramp-backup-directory-alist backup-directory-alist)

;;Disables Start-up Junk
(setq inhibit-startup-meassge t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

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


;; Changes "Yes or No" to accept "y" or "n" 
(defalias 'yes-or-no-p 'y-or-n-p)


;; Set path for my configuration
;; (setenv "PATH" "/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Library/TeX/texbin/")
(setenv "LANG" "en_US.UTF-8")

(setenv "PATH" (concat (getenv "HOME")
		       "/bin:"
		       "/usr/local/bin:"
		       "/usr/sbin:"
		       "/sbin:"
		       "/usr/bin:"
		       "/Library/TeX/texbin:"
                       "/opt/local/bin:"
                       (getenv "PATH")))

