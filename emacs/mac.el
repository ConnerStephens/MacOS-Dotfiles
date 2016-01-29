;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******** Making Emacs More OSX Friendly ******* ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Key-map changes
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)


;; Hotkey Changes
(global-set-key "\M-H" 'ns-do-hide-emacs)

;; Changes ispell to aspell for OSX
(setq-default ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

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
(defun fake-dvi-view()
  (interactive)
  (call-process-shell-command "open" nil nil nil (concat (file-name-sans-extension (buffer-file-name tex-last-buffer-texed)) ".pdf")))

(add-hook 'latex-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-v" 'fake-dvi-view)))
