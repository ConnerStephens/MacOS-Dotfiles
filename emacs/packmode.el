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
    aggressive-indent
    ace-jump-mode
    ace-jump-buffer
    browse-kill-ring
    buffer-move
    company
    exec-path-from-shell
    free-keys
    gnuplot-mode
    lua-mode
    multiple-cursors
    nasm-mode
    neotree
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

;; aggressive-indent
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)
(add-hook 'nasm-mode #'aggressive-indent-mode)
(add-hook 'html-mode #'aggressive-indent-mode)
(add-hook 'ruby-mode #'aggressive-indent-mode)
(add-hook 'python-mode #'aggressive-indent-mode)
(add-hook 'c-mode #'aggressive-indent-mode)
(add-hook 'java-mode #'aggressive-indent-mode)

;; asm-mode
(add-hook 'asm-mode-hook
	  (lambda () (electric-indent-local-mode 0)))
(font-lock-add-keywords 'asm-mode
			'(("\\.[a-zA-Z0-9_]+" . font-lock-type-face)))
;; '(("$" . font-lock-reference-face)
;;))
(setq asm-comment-char ?\#)

;; company-mode
(global-company-mode t)

;; multiple-cursors
(multiple-cursors-mode 1)


;; nasm-mode
(autoload 'nasm-mode "nasm-mode")
(add-to-list 'auto-mode-alist '("\\.\\(asm\\)$" . nasm-mode))
;(add-hook 'nasm-mode-hook
;	  (lambda ()
;	    (electric-indent-local-mode 0)))



;; intel-mode
(add-to-list 'auto-mode-alist '("\\.\\(s\\)$" . intel-mode))

;; *** nyan cat! ***
;; (nyan-mode 1)


;; org-mode
(add-hook 'org-mode-hook (lambda ()

			   ;; Syntax Highlighting
			   (setq org-src-fontify-natively t)

			   ;; Turn Off Babel Confirm
			   (setq org-confirm-babel-evaluate nil) 

			   (org-babel-do-load-languages
			    'org-babel-load-languages
			    '((emacs-lisp . t)
			      (python . t)
			      (ruby . t)))

			   ;; python-mode
			   (add-hook 'python-mode-hook
				     (lambda () (setq python-indent-offset 4)))
			   (visual-line-mode 1)))

;; shell-mode Close with no prompt 
(add-hook 'shell-mode-hook 
	  '(lambda ()
	     (process-kill-without-query (get-buffer-process (current-buffer)))
	     ;(ansi-color-for-comint-mode-on)
	     (toggle-truncate-lines 0)))

;; smex-mode
(autoload 'smex-mode "smex")
(global-set-key (kbd "M-x") 'smex)

;; Which-Key
(which-key-mode 1)



