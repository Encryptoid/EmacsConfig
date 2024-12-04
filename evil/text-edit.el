(evil-define-key '(normal visual emacs) 'evil-mode
	"U" (lambda () (interactive) (undo-redo))
)



(evil-define-key 'normal 'evil-mode
  (kbd "g l") 'project-find-file
)

;; Go to end of yank
(evil-define-key '(visual visual-line) 'evil-mode
  (kbd "y")
  '("Yank" . 
     (lambda () (interactive)
      (goto-char evil-visual-end)
      (evil-set-marker ?*)
      (evil-yank evil-visual-beginning evil-visual-end ?0)
      (evil-goto-mark ?*)
      (evil-normal-state t)
     )
  )
)

(evil-define-key 'normal 'evil-mode (kbd "Y")
	(lambda () (interactive) (evil-yank (point) (line-end-position)))
)

;; Paste in visual mode
(evil-define-key '(visual visual-line) 'evil-mode
  (kbd "p")
  'evil-paste-before) 

;; Visual select line
(evil-define-key 'visual 'evil-mode
  (kbd "v") '("Visual Select Line" . 
			  (lambda () (interactive)
				(evil-first-non-blank)
				(evil-exchange-point-and-mark)
				(evil-last-non-blank)
				(evil-forward-char) ; Not sure why this is needed
				)
			  )
  )

;;Indent Reduce/Increase
(evil-define-key '(visual visual-line) 'evil-mode
  (kbd "<")
  '("Indent Reduce" . 
              (lambda () (interactive)
                (evil-shift-left (region-beginning) (region-end))
                (evil-normal-state) ; Not sure why this is needed
                (evil-visual-restore) 
                )
              )
  )

(evil-define-key '(visual visual-line) 'evil-mode
  (kbd ">")
  '("Indent Increase" . 
    (lambda () (interactive)
      (evil-shift-right (region-beginning) (region-end))
      (evil-normal-state) ; Not sure why this is needed
      (evil-visual-restore) 
      )
    )
  )

;; O Commands
(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> RET")
  '("Insert Line Below" .
     (lambda () (interactive)
	   (evil-set-marker ?*) (evil-open-below 1) (evil-normal-state 1) (evil-goto-mark ?*)
     )
  )
)

;(evil-define-key 'normal 'evil-mode
  ;(kbd "<SPC> o")
  ;'("Insert Line Below" .
     ;(lambda () (interactive)
	   ;(evil-set-marker ?*) (evil-open-below 1) (evil-normal-state 1) (evil-goto-mark ?*)
     ;)
  ;)
;)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> O")
  '("Insert Line Above" .
     (lambda () (interactive)
	   (evil-set-marker ?*) (evil-open-above 1) (evil-normal-state 1) (evil-goto-mark ?*)
     )
  )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> d o")
  '("Delete Line Below" .
     (lambda () (interactive)
	 (evil-set-marker ?*) (evil-next-line 1) (kill-whole-line) (evil-goto-mark ?*)
     )
  )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> d RET")
  '("Delete Line Below" .
     (lambda () (interactive)
	 (evil-set-marker ?*) (evil-next-line 1) (kill-whole-line) (evil-goto-mark ?*)
     )
  )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> d O")
  '("Delete Line Above" .
     (lambda () (interactive)
	 (evil-set-marker ?*) (evil-previous-line 1) (kill-whole-line) (evil-goto-mark ?*)
     )
  )
)

(load-pack "rainbow-delimiters")
(rainbow-delimiters-mode t)
