

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
		 (load "~/.emacs.d/WindowManager.el")
		 (load "~/.emacs.d/key-mappings.el")
		 (load "~/.emacs.d/my-packages.el")
		 (load "~/.emacs.d/func.el")
		 (load "~/.emacs.d/mac.el")
		 (load "~/.emacs.d/hooks.el")
		 (load "~/.emacs.d/orgConfig.el")))

(setq custom-enabled-themes (load-file "~/.emacs.d/theme.el"))
	       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *****  Personal Settings ***** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Sets Default Window Size!
(setq initial-frame-alist '((width . 86) (height . 55)))

(ido-mode 1)
(show-paren-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(transient-mark-mode 0)

;; Enables kbd for making upper/lower case
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Eshell stuff
(setq comint-process-echoes t) ;; stops eshell from repeating commands 
(ansi-color-for-comint-mode-on) ;; 

;; Turns off auto save and back-ups
(setq auto-save-default nil) 
(setq make-backup-files nil)

;;Disables Start-up Junk
(setq inhibit-startup-meassge t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; Changes "Yes or No" to accept "y" or "n" 
(defalias 'yes-or-no-p 'y-or-n-p)

;; Changes ispell to aspell (After brew install of "aspell --with-lang-en") 

;; Set path for my configuration
;; (setenv "PATH" "/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Library/TeX/texbin/")

(setenv "PATH" (concat (getenv "HOME")
		       "/bin:"
		       "/usr/local/bin:"
		       "/usr/sbin:"
		       "/sbin:"
		       "/usr/bin:"
		       "/Library/TeX/texbin/:"
                       "/opt/local/bin:"
                       (getenv "PATH")))
(setenv "LANG" "en_US.UTF-8")
