; ~/.emacs.d/my-loadpackages.el

;loading package
(load "~/.emacs.d/my-packages.el")

;Smarter Compile

;; (require 'smarter-compile)
;; (add-to-list
;;  'smart-compile-alist
;;  '("\\.py\\'"   .   "python %f"))

;Smex

(require 'smex)
(autoload 'smex-mode "smex")
(global-set-key (kbd "M-x") 'smex)


