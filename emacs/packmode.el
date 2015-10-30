(require 'cl)

(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("elpa" . "http://tromey.com/elpa/") t)
(package-initialize)

(defvar required-packages
  '(    
    ace-jump-mode
    ace-jump-buffer
    browse-kill-ring
    exec-path-from-shell
    lua-mode
    nasm-mode
    nyan-mode
    rainbow-mode 
    org
    smex
  ) "a list of packages to ensure are installed at launch.")

;; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; *** Packages and Tweak! *** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Nasm
(autoload 'nasm-mode "nasm-mode")
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

;; Nyan Cat!
;;(nyan-mode 1)

;Smex
(autoload 'smex-mode "smex")
(global-set-key (kbd "M-x") 'smex)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******* Hooks ******* ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-mode
;(require 'org)
(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode 1)))


;;shell-mode Close with no prompt 
(add-hook 'shell-mode-hook 
	  '(lambda ()
	     (process-kill-without-query (get-buffer-process (current-buffer)))
	     ;(ansi-color-for-comint-mode-on)
	     (toggle-truncate-lines 0)))

;; sets indents for Python
(add-hook 'python-mode-hook
	  (lambda () (setq python-indent-offset 4)))

;; NASM 
(add-hook 'nasm-mode-hook
	  (lambda ()
	    (electric-indent-local-mode 0)))

;; Asm Mode
(add-hook 'asm-mode-hook
	  (lambda () (electric-indent-local-mode 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******* Org Config ******* ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Nasm Stuff
(setq nasm-basic-offset 4)

;; Org-Mode Syntax Highlighting
(setq org-src-fontify-natively t)


