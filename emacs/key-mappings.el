;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; All my personal key-bindings! ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Conner-Mode Key Prefs!

(define-prefix-command 'conner-prefix 'conner-prefix-map)
(define-key global-map "\M-o" 'conner-prefix)

;; Meta + single char
(define-key conner-prefix-map "a" 'alternate-buffer)
(define-key conner-prefix-map "b" 'switch-to-buffer-other-frame)
(define-key conner-prefix-map "c" 'compile)
(define-key conner-prefix-map "d" 'delete-frame)
(define-key conner-prefix-map "e" 'eval-buffer)
(define-key conner-prefix-map "f" 'find-file-other-frame)
(define-key conner-prefix-map "h" 'split-window-vertically)
(define-key conner-prefix-map "i" 'indent-region)
(define-key conner-prefix-map "j" 'ace-jump-line-mode)
(define-key conner-prefix-map "k" 'kill-other-buffer)
(define-key conner-prefix-map "l" 'ace-jump-mode)
(define-key conner-prefix-map "p" 'flip-windows)
(define-key conner-prefix-map "q" 'browse-kill-ring)
(define-key conner-prefix-map "r" 'find-file-read-only-other-frame)
(define-key conner-prefix-map "s" 'shell-current-directory)
(define-key conner-prefix-map "t" 'join-line)
(define-key conner-prefix-map "u" 'revert-buffer)
(define-key conner-prefix-map "v" 'split-window-horizontally)
(define-key conner-prefix-map "w" 'switch-to-buffer-other-window)
(define-key conner-prefix-map "x" 'comment-region)
(define-key conner-prefix-map "z" 'sudo-find-file)

;; Meta + Meta
(define-key conner-prefix-map "\M-a" 'alternate-buffer-in-other-window)
(define-key conner-prefix-map "\M-b" 'command-other-frame)
(define-key conner-prefix-map "\M-c" 'make-compile)
(define-key conner-prefix-map "\M-d" 'delete-other-frames)
(define-key conner-prefix-map "\M-f" 'find-and-display-file)
(define-key conner-prefix-map "\M-k" 'kill-current-buffer)
					;(define-key conner-prefix-map "\M-l" 'load-file)
(define-key conner-prefix-map "\M-s" 'sink-buffer)

(define-key conner-prefix-map "\M-x" 'uncomment-region)
(define-key conner-prefix-map "\M-w" 'browse-kill-ring)
(define-key conner-prefix-map "\M-z" 'sudo-current-file)

;; Meta + Ctrl
(define-key conner-prefix-map "\C-b" 'view-buffer-other-frame)
(define-key conner-prefix-map "\C-l" 'delete-minibuffer-contents)

;; Miscellaneous
(global-set-key (kbd "M-DEL") 'backward-kill-line)
(global-set-key (kbd "M-`") 'other-frame)
