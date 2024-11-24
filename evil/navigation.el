(setq evil-respect-visual-line-mode t)

;; Global bindings for H, J, K, excluding L to avoid overlap in visual mode
(evil-define-key '(normal emacs) 'evil-mode
  "J" (lambda () (interactive) (evil-next-line 5))
  "K" (lambda () (interactive) (evil-previous-line 5))
  "H" (lambda () (interactive) (evil-backward-char 15))
  "L" (lambda () (interactive) (evil-forward-char 15)))

(evil-define-motion lee-next-visual-line ()
  :type exclusive
  (evil-next-line 5)
)

(evil-define-motion lee-prev-visual-line ()
  :type exclusive
  (evil-next-line -5)
)

(define-key evil-visual-state-map (kbd "J") 'lee-next-visual-line)
(define-key evil-visual-state-map (kbd "K") 'lee-prev-visual-line)

;(evil-define-key '(normal visual emacs) help-mode-map (kbd "gl") 
  ;(lambda () (interactive) (message "hi")))
;(with-eval-after-load 'help
  ;(evil-define-key 'normal help-mode-map (kbd "gl")
    ;(lambda () (interactive) (message "hi"))))

;(defun godown()
  ;(interactive)
  ;(evil-next-line 5))
;(define-key evil-visual-state-map (kbd "j") 'godown)
(evil-define-key '(normal emacs) 'evil-mode
  (kbd "M-n") (lambda () (interactive) (tab-bar-new-tab))
  (kbd "M-c") (lambda () (interactive) (tab-bar-close-tab))
  (kbd "M-h") (lambda () (interactive) (tab-bar-switch-to-prev-tab))
  (kbd "M-l") (lambda () (interactive) (tab-bar-switch-to-next-tab))
  )
