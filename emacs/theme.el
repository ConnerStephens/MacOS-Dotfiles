;; My theme for Emacs 24:

(deftheme my-theme 
  "my-theme for Emacs!")

(let ((background         "#000000")
      (foreground         "#fff") ;"#e2fff7")
      (grey               "#444444")
      (grey2              "#7aa")
      (red                "#ff4040")
      (orange             "#F38630")
      (yellow             "#FF9") ;"#FFFF7F")
      (green              "#45e8a5")
      (green2             "#41BC93")
      (green3             "#22FFD3")
      (blue               "#00ACFF")
      (blue2              "#008DCA")
      (cyan               "#00FFFF") 
      (cyan2              "#018185")
      (purple             "#baf")
      (magenta            "#99aFfF"))
  
  (custom-theme-set-faces
   'my-theme
   `(default ((t (:background, background :foreground, foreground))))
   
    ;; font-lock
   `(font-lock-builtin-face ((t (:foreground ,cyan))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,grey2))))
   `(font-lock-comment-face ((t (:foreground ,grey2))))
   `(font-lock-constant-face ((t (:foreground ,blue))))
   `(font-lock-doc-face ((t (:foreground ,yellow))))
   `(font-lock-doc-string-face ((t (:foreground ,yellow))))
   `(font-lock-function-name-face ((t (:foreground ,red))))
   `(font-lock-keyword-face ((t (:foreground  ,cyan))))
   `(font-lock-negation-char-face ((t (:foreground ,red))))
   `(font-lock-operator-face ((t (:foreground ,red))))
   `(font-lock-number-face ((t (:foreground ,green))))
   `(font-lock-preprocessor-face ((t (:foreground ,cyan))))
   `(font-lock-reference-face ((t (:foreground, orange))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground, orange))))
   `(font-lock-regexp-grouping-construct ((t (:foreground, orange))))
   `(font-lock-string-face ((t (:foreground, yellow))))
   `(font-lock-type-face ((t (:foreground, yellow))))
   `(font-lock-variable-name-face ((t (:foreground, blue))))
   `(font-lock-warning-face ((t (:foreground, red))))
 
   ;; Editor
   `(cursor ((t (:background, foreground :foreground, background))))
   `(highlight ((t (:background,grey :foreground ,green))))
   `(fringe ((t (:foreground ,background :background ,background))))
   `(region ((t (:background ,grey :foreground ,green))))
   `(success ((t (:foreground ,yellow :weight bold))))
   `(warning ((t (:foreground ,red :weight bold))))
   `(header-line ((t (:foreground ,yellow))))
;                                  :box (:line-width -1 :style released-button)))))
   ;; UI
   `(menu ((t (:foreground ,foreground :background ,background))))
   `(mode-line ((t (:foreground ,yellow
                                :background ,background
                                :box (:line-width -1 :style pressed-button)))))
   `(mode-line-inactive ((t (:foreground ,grey
                                         :background ,background
                                         :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((t (:foreground ,cyan :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,cyan))))

   ;; linenum mode
   `(linum ((t (:foreground ,green))))

   ;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,foreground :slant italic :weight bold))) t)
   `(org-agenda-dimmed-todo-face ((t (:foreground ,green))))
   `(org-agenda-structure
      ((t (:inherit font-lock-comment-face))))

   `(org-archived ((t (:foreground ,foreground :weight bold))))
   `(org-checkbox ((t (:background ,background :foreground ,foreground
                                   :box (:line-width 1 :style released-button)))))

   `(org-block ((t (:foreground ,blue))))
   `(org-date ((t (:foreground ,green :underline t))))
   `(org-deadline-announce ((t (:foreground ,red))))
   `(org-done ((t (:bold t :weight bold :foreground ,green))))
   `(org-formula ((t (:foreground ,yellow))))

   `(org-headline-done ((t (:foreground ,green))))
   `(org-hide    ((t (:foreground ,grey))))
   `(org-level-1 ((t (:foreground ,cyan))))
   `(org-level-2 ((t (:foreground ,yellow))))
   `(org-level-3 ((t (:foreground ,purple))))
   `(org-level-4 ((t (:foreground ,green))))
   `(org-level-5 ((t (:foreground ,orange))))
   `(org-level-6 ((t (:foreground ,red))))
   `(org-level-7 ((t (:foreground ,cyan2))))
   `(org-level-8 ((t (:foreground ,magenta))))

   `(org-link ((t (:foreground ,blue :underline t))))
   `(org-scheduled ((t (:foreground ,green))))
   `(org-scheduled-previously ((t (:foreground ,red))))
   `(org-scheduled-today ((t (:foreground ,blue))))
   `(org-sexp-date ((t (:foreground ,blue :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))

   `(org-table ((t (:foreground ,yellow))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,orange))))
   `(org-todo ((t (:bold t :foreground ,red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,red :weight bold :underline nil))))
   `(org-column ((t (:background ,background))))
   `(org-column-title ((t (:background ,background :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,foreground :background ,background))))
   `(org-mode-line-clock-overrun ((t (:foreground ,background :background ,orange))))
   

   `(org-ellipsis ((t (:foreground ,yellow :underline t))))
   `(org-footnote ((t (:foreground ,cyan :underline t))))
   
   ;; outline
   `(outline-1 ((t (:foreground ,red))))
   `(outline-2 ((t (:foreground ,green))))
   `(outline-3 ((t (:foreground ,blue))))
   `(outline-4 ((t (:foreground ,yellow))))
   `(outline-5 ((t (:foreground ,cyan))))
   `(outline-6 ((t (:foreground ,cyan))))
   `(outline-7 ((t (:foreground ,red))))
   `(outline-8 ((t (:foreground ,purple))))
   
   ;;ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,foreground :background ,background :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,blue :background ,background :inverse-video nil))))

   ;;;;; compilation
   `(compilation-column-number ((t (:foreground ,blue))))
   `(compilation-error ((t (:bold t :weight bold :foreground, red))))
   `(compilation-warning ((t (:bold t :foreground ,orange :weight bold))))
   `(compilation-warning-face ((t (:bold t :foreground ,orange :weight bold))))

   `(compilation-column-face ((t (:foreground ,yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,green))))
   `(compilation-error-face ((t (:foreground ,red :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,yellow))))
   `(compilation-info-face ((t (:foreground ,blue))))
   `(compilation-info ((t (:foreground ,green :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,green))))
   `(compilation-line-face ((t (:foreground ,yellow))))
   `(compilation-line-number ((t (:foreground ,yellow))))
   `(compilation-message-face ((t (:foreground ,blue))))
   `(compilation-warning-face ((t (:foreground ,red :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,green :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,yellow :weight bold))))
   ;;; grep
   `(grep-error-face ((t (:foreground ,red :weight bold :underline t))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,cyan :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,red :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-yellow))))
   `(eshell-ls-clutter ((t (:inherit font-lock-yellow))))
   `(eshell-ls-directory ((t (:foreground ,blue :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,red :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,foreground))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,blue :weight bold))))

   ;; erc
   `(erc-action-face ((t (:inherit green))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,cyan :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,blue))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit green))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,yellow))))
   `(erc-keyword-face ((t (:foreground ,red :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,cyan :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,cyan :weight bold))))
   `(erc-nick-msg-face ((t (:inherit cyan))))
   `(erc-notice-face ((t (:foreground ,red))))
   `(erc-pal-face ((t (:foreground ,orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,cyan :background ,background :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,grey))))
   `(erc-underline-face ((t (:underline t))))

 ;; ido-mode
   `(ido-first-match ((t (:foreground ,yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,green :weight bold))))
   `(ido-subdir ((t (:foreground ,red))))
   `(ido-indicator ((t (:foreground ,cyan :background ,yellow))))
   
 ;; term
   `(term ((t ( :foreground ,cyan))))

   `(term-color-black ((t (:foreground ,background
                                       :background ,background))))
   `(term-color-red ((t (:foreground ,purple
                                       :background ,purple))))
   `(term-color-green ((t (:foreground ,cyan2
                                       :background ,green))))
   `(term-color-yellow ((t (:foreground ,red
                                       :background ,red))))
   `(term-color-blue ((t (:foreground ,yellow
                                      :background ,yellow))))
   `(term-color-magenta ((t (:foreground ,purple
                                        :background ,purple))))
   `(term-color-cyan ((t (:foreground ,grey
                                       :background ,blue))))
   `(term-color-white ((t (:foreground ,foreground
                                       :background ,foreground)))) 

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
