;; https://github.com/minad/vertico
(load-pack "vertico")
(vertico-mode t)

;; https://github.com/minad/marginalia/
(load-pack "marginalia")
(marginalia-mode t)

;; https://github.com/oantolin/orderless
(load-pack "orderless")
(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles basic partial-completion))))

(load-pack "vertico/extensions" "vertico-multiform")
(vertico-multiform-mode t)

;; https://github.com/tumashu/vertico-posframe
;; (Alternative) https://github.com/muffinmad/emacs-mini-frame
;(load-pack "vertico-posframe")
;(vertico-posframe-mode t)


;(setq vertico-posframe-height 50)
;(setq vertico-posframe-width 220)
;(setq vertico-posframe-border-width 5)

(setq vertico-count 50)


;(setq vertico-posframe-parameters
       ;'((left-fringe . 8)
         ;(right-fringe . 8)
		 ;)
	   ;)

;(let ((choices '("Option 1" "Option 2" "Option 3")))
  ;(completing-read "Select an option: " choices)
;)


;(setq vertico-multiform-categories
          ;'((file 'buffer)
            ;(imenu (:not indexed mouse))
            ;(symbol (vertico-sort-function . vertico-sort-alpha)))
;)

;(setq vertico-multiform-categories
        ;'((file . 'buffer)) ;; Also use buffer for consult-grep
        ;vertico-buffer-display-action
        ;'(display-buffer-below-selected
          ;(window-height . 60)   ;; Adjust height to create a compact view
          ;(window-width . 20))
;)

(load-pack "vertico/extensions" "vertico-buffer")
(setq vertico-buffer-display-action '(display-buffer-same-window))
(vertico-buffer-mode t)
(load-pack "vertico/extensions" "vertico-grid")

;(setq vertico-multiform-categories
      ;'()
;)
;
;(setq vertico-multiform-categories
      ;'((t buffer))
;)




;(setq consult-preview-key '(:debounce 0.2 any)
      ;consult-buffer-display #'switch-to-buffer)
;
;(add-to-list 'display-buffer-alist
             ;'("\\*Consult Preview\\*"
               ;(display-buffer-reuse-window display-buffer-at-bottom)
               ;(window-height . 0.25)))
;(add-to-list 'display-buffer-alist
             ;'("\\*Consult Preview\\*"
               ;(display-buffer-reuse-window display-buffer-pop-up-window)
               ;(inhibit-same-window . t)
               ;(reusable-frames . visible)
               ;(window-height . 0.25)))

;; Turn on fuzzy completion
(setq orderless-matching-styles '(orderless-literal
                                  orderless-regexp
                                  orderless-initialism
                                  orderless-flex)) ;; Flex provides flexible fuzzy matching
