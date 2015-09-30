;; My theme for Emacs 24:

(deftheme my-theme 
  "my-theme for Emacs!")
   
(let ((my-theme-fg          "#ffffff")
      (my-theme-bg          "#000000") ;"#403F3F")
      (my-theme-bg-hi          "#444")
      (my-theme-fg-hi       "#ffffff")

      (my-theme-grey           "#ccc")
      (my-theme-grey+1         "#bdbdbd")
      (my-theme-grey+2         "#cccccc")
      (my-theme-grey+3         "#8e8e8e")
      (my-theme-grey-1         "#bbb")
      (my-theme-grey-2         "#888")
      (my-theme-grey-3         "#444")
      (my-theme-grey-4      "#191910") ;"#363636")
      (my-theme-grey-5      "#8e8e8e")
      
      (my-theme-red         "#FF5050") ;#f22c2c")
     

      (my-theme-orange      "#FFC75F")
      (my-theme-orange+1    "#EF907E")
      (my-theme-orange-1    "#AC4123")
      (my-theme-yellow+1    "#FFFF7F")
      (my-theme-yellow         "#FB0")
      (my-theme-yellow-1       "#B90")


      (my-theme-green       "#a4fdba")
      (my-theme-green+1     "#aaf5bf")
      (my-theme-green+2     "#acfcd1")
      (my-theme-green+3     "#9ae2bc")
      (my-theme-green+4     "#20e3b7")

      (my-theme-cyan        "#00ffff")
      (my-theme-cyan+1      "#b9f9f3")
      (my-theme-cyan+2      "#6ef3fd")
      (my-theme-cyan+3      "#84b3b6")
      (my-theme-cyan+4      "#a6e0e4")
      (my-theme-cyan+5      "#00b7b7")
      (my-theme-cyan+6      "#007f7f")
      
      (my-theme-green+5     "#66a3a3")
     ; (my-theme-green       "#50d42b")
      (my-theme-green-1     "#54ab54")
      (my-theme-green-2     "#0ffe33")
      (my-theme-green-3     "#00ff11")
      (my-theme-green-4     "#9aff8e")

   ;   (my-theme-cyan        "#00ffff")
      (my-theme-cyan-1      "#45e8a5")
      
      (my-theme-blue        "#37c4e1")
      (my-theme-blue+1      "#0080ff")
      (my-theme-blue+2      "#4dffaa") ;#0099FF")
      (my-theme-blue+3      "#00ff80")

      (my-theme-magenta     "#99aFfF")
      (my-theme-purple      "#af88ec"))

  
  (custom-theme-set-faces
   'my-theme
   `(default ((t (:background ,my-theme-bg :foreground ,my-theme-fg))))
 
   ;; Editor
   `(cursor ((t (:background ,my-theme-fg :foreground ,my-theme-bg))))
   `(highlight ((t (:background ,my-theme-bg-hi :foreground ,my-theme-cyan+1))))
   `(fringe ((t (:foreground ,my-theme-bg :background ,my-theme-bg))))
   `(region ((t (:background ,my-theme-bg-hi :foreground ,my-theme-cyan+1))))
   `(success ((t (:foreground ,my-theme-yellow+1 :weight bold))))
   `(warning ((t (:foreground ,my-theme-red :weight bold))))
   `(header-line ((t (:foreground ,my-theme-yellow+1
                                  :box (:line-width -1 :style released-button)))))
   ;; UI
   `(menu ((t (:foreground ,my-theme-fg :background ,my-theme-bg))))
   `(mode-line ((t (:foreground ,my-theme-yellow+1
                                :background ,my-theme-bg
                                :box (:line-width -1 :style pressed-button)))))
   `(mode-line-inactive ((t (:foreground ,my-theme-grey-2
                                         :background ,my-theme-bg
                                         :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((t (:foreground ,my-theme-cyan :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,my-theme-cyan))))
 
   ;; font lock
   `(font-lock-builtin-face ((t (:foreground ,my-theme-cyan))))
   `(font-lock-comment-face ((t (:foreground ,my-theme-grey+3))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,my-theme-grey+3))))
   `(font-lock-constant-face ((t (:foreground ,my-theme-yellow+1))))
   `(font-lock-doc-string-face ((t (:foreground ,my-theme-fg-hi))))
   `(font-lock-function-name-face ((t (:foreground ,my-theme-red))))
   `(font-lock-keyword-face ((t (:foreground ,my-theme-cyan))))
   `(font-lock-string-face ((t (:foreground ,my-theme-yellow+1))))
   `(font-lock-type-face ((t (:foreground ,my-theme-yellow+1))))
   `(font-lock-variable-name-face ((t (:foreground ,my-theme-purple))))   
   `(font-lock-warning-face ((t (:foreground ,my-theme-red))))

  ;; linenum mode
   `(linum ((t (:foreground ,my-theme-cyan+4 :background ,my-theme-grey-4))))

   ;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,my-theme-fg :slant italic :weight bold))) t)

    `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))

   `(org-archived ((t (:foreground ,my-theme-fg :weight bold))))
   `(org-checkbox ((t (:background ,my-theme-bg :foreground ,my-theme-fg
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,my-theme-green+1 :underline t))))
   `(org-deadline-announce ((t (:foreground ,my-theme-red))))
   `(org-done ((t (:bold t :weight bold :foreground ,my-theme-green))))
   `(org-formula ((t (:foreground ,my-theme-yellow))))

   `(org-headline-done ((t (:foreground ,my-theme-green))))
   `(org-hide ((t (:foreground ,my-theme-bg-hi))))
   `(org-level-1 ((t (:foreground ,my-theme-cyan))))
   `(org-level-2 ((t (:foreground ,my-theme-yellow+1))))
   `(org-level-3 ((t (:foreground ,my-theme-purple))))
   `(org-level-4 ((t (:foreground ,my-theme-green-2))))
   `(org-level-5 ((t (:foreground ,my-theme-orange))))
   `(org-level-6 ((t (:foreground ,my-theme-green+1))))
   `(org-level-7 ((t (:foreground ,my-theme-magenta))))
   `(org-level-8 ((t (:foreground ,my-theme-blue+1))))

   `(org-link ((t (:foreground ,my-theme-blue+2 :underline t))))
   `(org-scheduled ((t (:foreground ,my-theme-green-2))))
   `(org-scheduled-previously ((t (:foreground ,my-theme-red))))
   `(org-scheduled-today ((t (:foreground ,my-theme-blue+1))))
   `(org-sexp-date ((t (:foreground ,my-theme-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))

   `(org-table ((t (:foreground ,my-theme-yellow+1))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,my-theme-orange))))
   `(org-todo ((t (:bold t :foreground ,my-theme-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,my-theme-red :weight bold :underline nil))))
   `(org-column ((t (:background ,my-theme-bg))))
   `(org-column-title ((t (:background ,my-theme-bg :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,my-theme-fg :background ,my-theme-bg))))
   `(org-mode-line-clock-overrun ((t (:foreground ,my-theme-bg :background ,my-theme-orange-1))))
   `(org-ellipsis ((t (:foreground ,my-theme-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,my-theme-cyan :underline t))))
   
   ;; outline
   `(outline-1 ((t (:foreground ,my-theme-red))))
   `(outline-2 ((t (:foreground ,my-theme-green))))
   `(outline-3 ((t (:foreground ,my-theme-blue))))
   `(outline-4 ((t (:foreground ,my-theme-yellow))))
   `(outline-5 ((t (:foreground ,my-theme-cyan))))
   `(outline-6 ((t (:foreground ,my-theme-cyan-1))))
   `(outline-7 ((t (:foreground ,my-theme-red))))
   `(outline-8 ((t (:foreground ,my-theme-purple))))
   
   ;;ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,my-theme-fg-hi :background ,my-theme-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,my-theme-green+2 :background ,my-theme-bg :inverse-video nil))))

   ;;;;; compilation
   `(compilation-column-number ((t (:foreground ,my-theme-blue))))
   `(compilation-error ((t (:bold t :weight bold :foreground, my-theme-red))))
   `(compilation-warning ((t (:bold t :foreground ,my-theme-orange :weight bold))))
   `(compilation-warning-face ((t (:bold t :foreground ,my-theme-orange :weight bold))))

   `(compilation-column-face ((t (:foreground ,my-theme-yellow+1))))
   `(compilation-enter-directory-face ((t (:foreground ,my-theme-green))))
   `(compilation-error-face ((t (:foreground ,my-theme-red :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,my-theme-yellow+1))))
   `(compilation-info-face ((t (:foreground ,my-theme-blue))))
   `(compilation-info ((t (:foreground ,my-theme-green-2 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,my-theme-green))))
   `(compilation-line-face ((t (:foreground ,my-theme-yellow+1))))
   `(compilation-line-number ((t (:foreground ,my-theme-yellow+1))))
   `(compilation-message-face ((t (:foreground ,my-theme-blue))))
   `(compilation-warning-face ((t (:foreground ,my-theme-red :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,my-theme-green-2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,my-theme-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,my-theme-yellow+1 :weight bold))))
   ;;; grep
   `(grep-error-face ((t (:foreground ,my-theme-red :weight bold :underline t))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,my-theme-cyan :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,my-theme-red :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-yellow+1))))
   `(eshell-ls-clutter ((t (:inherit font-lock-yellow+1))))
   `(eshell-ls-directory ((t (:foreground ,my-theme-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,my-theme-red :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,my-theme-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,my-theme-yellow+1 :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,my-theme-blue+1 :weight bold))))

   ;; erc
   `(erc-action-face ((t (:inherit my-theme-green+2))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,my-theme-cyan :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,my-theme-purple))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit my-theme-cyan+3))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,my-theme-yellow+1))))
   `(erc-keyword-face ((t (:foreground ,my-theme-red :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,my-theme-cyan :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,my-theme-cyan :weight bold))))
   `(erc-nick-msg-face ((t (:inherit my-theme-cyan))))
   `(erc-notice-face ((t (:foreground ,my-theme-grey+3))))
   `(erc-pal-face ((t (:foreground ,my-theme-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,my-theme-cyan :background ,my-theme-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,my-theme-grey+3))))
   `(erc-underline-face ((t (:underline t))))

   ;; ido-mode
   `(ido-first-match ((t (:foreground ,my-theme-fg :weight bold))))
   `(ido-only-match ((t (:foreground ,my-theme-green :weight bold))))
   `(ido-subdir ((t (:foreground ,my-theme-grey+3))))
   `(ido-indicator ((t (:foreground ,my-theme-cyan :background ,my-theme-grey+3))))
 ;; term
   `(term ((t ( :foreground ,my-theme-cyan))))

   `(term-color-black ((t (:foreground ,my-theme-bg
                                       :background ,my-theme-bg))))
   `(term-color-red ((t (:foreground ,my-theme-purple
                                       :background ,my-theme-purple))))
   `(term-color-green ((t (:foreground ,my-theme-cyan+6
                                       :background ,my-theme-cyan+6))))
   `(term-color-yellow ((t (:foreground ,my-theme-red
                                       :background ,my-theme-red))))
   `(term-color-blue ((t (:foreground ,my-theme-yellow+1
                                      :background ,my-theme-yellow+1))))
   `(term-color-magenta ((t (:foreground ,my-theme-purple
                                         :background ,my-theme-purple))))
   `(term-color-cyan ((t (:foreground ,my-theme-grey+3
                                       :background ,my-theme-grey+3))))
   `(term-color-white ((t (:foreground ,my-theme-fg-hi
                                       :background ,my-theme-fg-hi)))) 
   ))
;; Change Ansi Colors.
   (setq ansi-color-names-vector
	 ["#000000" "#FF5050" "#4dffaa" "#af88ec"
	  "#FFFF7F" "#99aFfF" "#00ffff" "#ffffff"])
;; Transparent Windows
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
(provide-theme 'my-theme)
