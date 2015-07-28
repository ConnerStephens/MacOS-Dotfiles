; ~/.emacs

;-----------------------------------------
(load "~/.emacs.d/my-loadpackages.el")
(add-hook 'after-init-hook
	  '(lambda ()
	     (load "~/.emacs.d/init.el")
	     (load "~/.emacs.d/WindowManager.el")
	     (load "~/.emacs.d/key-mappings.el")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-hook 'python-mode-hook
	  (lambda () (setq python-indent-offset 4)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (load-file "~/.emacs.d/theme.el"))
					;'(safe-local-variable-values (quote ((compile . python))))
 
 )
