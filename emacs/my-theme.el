;; My theme for Emacs 24:

(deftheme my-theme 
  "my-theme brighten your eyes. Created 2012-06-16.")
   
(let ((my-theme-fg             "#ddd")
      (my-theme-bg          "#060606")
      (my-theme-fg-hi       "#ffffff")
      (my-theme-bg-hi       "#545454")

      (my-theme-grey           "#ccc")
      (my-theme-grey-1         "#bbb")
      (my-theme-grey-2         "#888")
      (my-theme-grey-3         "#444")
      (my-theme-grey-4      "#363636")
      
      (my-theme-red         "#FF0000")

      (my-theme-orange      "#f4511e")
      (my-theme-orange+1    "#EF907E")
      (my-theme-orange      "#E75544")
      (my-theme-orange-1    "#AC4123")

      (my-theme-yellow+1    "#FFFF00")
      (my-theme-yellow         "#FB0")
      (my-theme-yellow-1       "#B90")

      (my-theme-green+1     "#00ff80")
      (my-theme-green       "#50d42b")
      (my-theme-green-1     "#54ab54")
      (my-theme-green-2     "#0ffe33")

      (my-theme-cyan        "#00ffff")
      (my-theme-cyan-1      "#45e8a5")
      
      (my-theme-blue        "#0080ff")
      (my-theme-blue+1      "#000fff")
      (my-theme-blue+2      "#60F2D1")

      (my-theme-magenta     "#99aFfF")
      (my-theme-purple      "#B477DF"))

  (custom-theme-set-faces
   'my-theme
   `(default ((t (:background ,my-theme-bg :foreground ,my-theme-fg))))
 
   ;; Editor
   `(cursor ((t (:background ,my-theme-fg :foreground ,my-theme-bg))))
   `(highlight ((t (:background ,my-theme-bg-hi :foreground ,my-theme-green-2))))
   `(region ((t (:background ,my-theme-bg-hi :foreground ,my-theme-green-2))))
   `(header-line ((t (:foreground ,my-theme-yellow+1
                                  :box (:line-width -1 :style released-button)))))
   ;; UI
   `(menu ((t (:foreground ,my-theme-fg :background ,my-theme-bg))))
   `(mode-line ((t (:foreground ,my-theme-yellow+1
                                :background ,my-theme-grey-4
                                :box (:line-width -1 :style pressed-button)))))
   `(mode-line-inactive ((t (:foreground ,my-theme-grey-2
                                         :background ,my-theme-bg
                                         :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((t (:foreground ,my-theme-cyan :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,my-theme-cyan))))
 
   ;; font lock
   `(font-lock-comment-face ((t (:foreground ,my-theme-blue))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,my-theme-blue))))
   `(font-lock-constant-face ((t (:foreground ,my-theme-cyan))))
   `(font-lock-builtin-face ((t (:foreground ,my-theme-cyan))))
   `(font-lock-function-name-face ((t (:foreground ,my-theme-purple))))
   `(font-lock-variable-name-face ((t (:foreground ,my-theme-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,my-theme-red))))
   `(font-lock-string-face ((t (:foreground ,my-theme-yellow+1))))
   `(font-lock-doc-string-face ((t (:foreground ,my-theme-fg-hi))))
   `(font-lock-type-face ((t (:foreground ,my-theme-yellow+1))))

   ;; linenum mode
   `(linum ((t (:foreground ,my-theme-green+1 :background ,my-theme-grey-4))))

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
   `(org-level-3 ((t (:foreground ,my-theme-blue))))
   `(org-level-4 ((t (:foreground ,my-theme-green-2))))
   `(org-level-5 ((t (:foreground ,my-theme-red))))
   `(org-level-6 ((t (:foreground ,my-theme-green+1))))
   `(org-level-7 ((t (:foreground ,my-theme-magenta))))
   `(org-level-8 ((t (:foreground ,my-theme-purple))))

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
   `(outline-1 ((t (:foreground ,my-theme-orange))))
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
     ((t (:foreground ,my-theme-green-2 :background ,my-theme-bg :inverse-video nil))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,my-theme-cyan :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,my-theme-red :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,my-theme-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,my-theme-orange :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,my-theme-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,my-theme-purple :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,my-theme-blue+1 :weight bold))))

   ;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,my-theme-yellow+1 :weight bold))))
   `(ido-only-match ((t (:foreground ,my-theme-green+1 :weight bold))))
   `(ido-subdir ((t (:foreground ,my-theme-red))))
   `(ido-indicator ((t (:foreground ,my-theme-cyan :background ,my-theme-red))))
   ))
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
(provide-theme 'my-theme)
