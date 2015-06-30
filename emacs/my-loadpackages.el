; ~/.emacs.d/my-loadpackages.el

;loading package
(load "~/.emacs.d/my-packages.el")

;Smex
(require 'smex)
(autoload 'smex-mode "smex")
(global-set-key (kbd "M-x") 'smex)

;Nasm
(autoload 'nasm-mode "nasm-mode")
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))
