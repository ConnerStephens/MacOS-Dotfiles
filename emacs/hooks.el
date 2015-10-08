;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******* Hooks For Various Modes ******* ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-mode-hooks
(require 'org)
(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode 1)
			   ))

;;Shell Mode: Close with no prompt 
(add-hook 'shell-mode-hook 
	  '(lambda ()
	     (process-kill-without-query (get-buffer-process (current-buffer)))
	     ;(ansi-color-for-comint-mode-on)
	     (toggle-truncate-lines 0)))



;; Sets indents for Python
(add-hook 'python-mode-hook
	  (lambda () (setq python-indent-offset 4)))

;; NASM & ASM disable <RET> indents
(add-hook 'nasm-mode-hook
	  (lambda () (electric-indent-local-mode 0)))
(add-hook 'asm-mode-hook
	  (lambda () (electric-indent-local-mode 0)))

