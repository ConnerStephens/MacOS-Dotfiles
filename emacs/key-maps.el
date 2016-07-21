;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******* Key Mappings ******* ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Conner-Mode Key Prefs!

(define-prefix-command 'conner-prefix 'conner-prefix-map)
(define-key global-map "\M-o" 'conner-prefix)

;; Meta + single char
(define-key conner-prefix-map "a" 'alternate-buffer)
(define-key conner-prefix-map "b" 'switch-to-buffer-other-frame)
(define-key conner-prefix-map "c" 'compile)
(define-key conner-prefix-map "d" 'delete-frame)
(define-key conner-prefix-map "e" 'company-complete)
;; (define-key conner-prefix-map "e" ')
(define-key conner-prefix-map "f" 'find-file-other-frame) 
(define-key conner-prefix-map "g" 'hippie-expand)
;;(define-key conner-prefix-map "h" 'split-window-vertically) 
(define-key conner-prefix-map "i" 'indent-region) 
(define-key conner-prefix-map "j" 'ace-jump-line-mode)
(define-key conner-prefix-map "k" 'kill-other-buffer)
(define-key conner-prefix-map "l" 'ace-jump-mode)
(define-key conner-prefix-map "m" 'align-regexp)
(define-key conner-prefix-map "p" 'flip-windows)
(define-key conner-prefix-map "q" 'browse-kill-ring)
(define-key conner-prefix-map "r" 'find-file-read-only-other-frame)
(define-key conner-prefix-map "s" 'shell-current-directory)
(define-key conner-prefix-map "t" 'join-line)
(define-key conner-prefix-map "u" 'revert-buffer)
;;(define-key conner-prefix-map "v" 'split-window-horizontally)
(define-key conner-prefix-map "w" 'switch-to-buffer-other-window)
(define-key conner-prefix-map "x" 'comment-region)
(define-key conner-prefix-map "z" 'sudo-find-file)

(define-key conner-prefix-map "1" 'make-osx-nasm-compile)
(define-key conner-prefix-map "2" 'make-linux-nasm-compile)
(define-key conner-prefix-map "3" 'make-win-nasm-compile)

;; Meta + Meta
(define-key conner-prefix-map "\M-a" 'alternate-buffer-in-other-window)
(define-key conner-prefix-map "\M-b" 'command-other-frame)
(define-key conner-prefix-map "\M-c" 'make-compile)
(define-key conner-prefix-map "\M-d" 'delete-other-frames)
(define-key conner-prefix-map "\M-f" 'find-and-display-file)
;;(define-key conner-prefix-map "\M-k" 'kill-current-buffer)
(define-key conner-prefix-map "\M-k" 'kill-buffer-and-window)
;;(define-key conner-prefix-map "\M-s" 'sink-buffer)
(define-key conner-prefix-map "\M-x" 'uncomment-region)
(define-key conner-prefix-map "\M-z" 'sudo-current-file)

;; Meta + Ctrl
;; (define-key conner-prefix-map "\C-b" 'view-buffer-other-frame)
;; (define-key conner-prefix-map "\C-f" 'find-file-other-window)
(define-key conner-prefix-map "\C-l" 'delete-minibuffer-contents)
(define-key conner-prefix-map "\C-k" 'kill-other-buffers)

;; Miscellaneous
(global-set-key (kbd "M-DEL") 'backward-kill-line)
(global-set-key (kbd "M-`") 'other-frame)
;; (global-set-key (kbd "M-[") 'company-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******** BINDINGS II ******** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-prefix-command 'conner2-prefix 'conner2-prefix-map)
(define-key global-map (kbd "M-p") 'conner2-prefix)
(define-key conner2-prefix-map "d" 'mc/edit-lines)
(define-key conner2-prefix-map "h" 'mc/mark-all-in-region)
(define-key conner2-prefix-map "a" 'mc/mark-all-like-this)
(define-key conner2-prefix-map "n" 'mc/mark-next-like-this)
(define-key conner2-prefix-map "p" 'mc/mark-previous-like-this)
(define-key conner2-prefix-map "\M-p" 'mc/unmark-next-like-this)
(define-key conner2-prefix-map "\M-n" 'mc/unmark-previous-like-this)
(define-key conner2-prefix-map "k" 'mc/skip-to-next-like-this)
(define-key conner2-prefix-map "j" 'mc/skip-to-previous-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ******** BINDINGS III ******** ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-prefix-command 'conner3-prefix 'conner3-prefix-map)
(define-key global-map (kbd "å") 'conner3-prefix) 


(global-set-key (kbd "Ú") 'ispell) ;; Alt-shift-: 
