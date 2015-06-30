;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.		     ;;
;; For various things like:	     ;;
;; - Personal settings,		     ;;
;; - Mode-hooks,		     ;;
;; - And various hacks. 	     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;
;; Personal Settings ;;
;;;;;;;;;;;;;;;;;;;;;;;

;;Just Some Personal Settings

(setq default-directory "~/")
(setq mac-command-modifier 'meta)
(ido-mode 1)
(show-paren-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(transient-mark-mode 0)

;; Turns off auto save and back-ups
(setq auto-save-default nil) 
(setq make-backup-files nil)

;;Disables Start-up Junk
(setq inhibit-startup-meassge t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; Changes "Yes or No" to accept "y" or "n" 
(defalias 'yes-or-no-p 'y-or-n-p)

;; Changes ispell to aspell (After brew install of "aspell --with-lang-en") 

(setq-default ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Pull all auto saves in their own directory
;;(setq save-place-file "~/.emacs.d/saved-places")
;;(require 'saveplace)
;;(autoload 'toggle-save-place "saveplace" )


;;;;;;;;;;;;;;;;
;; Mode Hooks ;;
;;;;;;;;;;;;;;;;


;; org-mode-hookes
(require 'org)
(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode 1)
			   ))

;;Shell Mode: Close with no prompt 
(add-hook 'shell-mode-hook 
	  '(lambda ()
	     (process-kill-without-query (get-buffer-process (current-buffer)))
	     ;;(local-set-key (kbd "C-c SPC") 'ace-jump-mode)
             (toggle-truncate-lines 0)))


;; LaTeX to Pdf 
(setq latex-run-command "pdflatex")
(defvar tex-last-action nil)
(defadvice tex-file (after choose-output activate)
  (setq tex-last-action nil))
(defadvice tex-buffer (after choose-output activate)
  (setq tex-last-action 'temp))
(defadvice tex-region (after choose-output activate)
  (setq tex-last-action 'temp))
(defun fake-dvi-view()
  (interactive)
  (let ((pdffile
         (concat (file-name-sans-extension (if tex-last-action
                                               tex-last-temp-file
                                               (buffer-file-name tex-last-buffer-texed)))
                 ".pdf")))
    (call-process-shell-command "open" nil nil nil pdffile)))
;;   (defun fake-dvi-view()
;;   (interactive)
;;   (call-process-shell-command "open" nil nil nil (concat (file-name-sans-extension (buffer-file-name tex-last-buffer-texed)) ".pdf")))

(add-hook 'latex-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-v" 'fake-dvi-view)))

;; Set path for my configuration
(setenv "PATH" "/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/texlive/2014/bin/universal-darwin:")
