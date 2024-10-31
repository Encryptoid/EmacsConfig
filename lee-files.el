(defun open-file (file)
  (find-file (expand-file-name file))
  )

(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", f")
  (cons "Open File" (make-sparse-keymap)))
 
(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", f e")
  (cons "Emacs" (make-sparse-keymap)))

(setq-default emacs-todo-file "~/notes/emacs/todo.org")
(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", f e t") '("Todo" .
    (lambda () (interactive)
	  (open-file emacs-todo-file)
    )
  )
)

(setq-default emacs-notes-file "~/notes/emacs/notes.org")
(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", f e n") '("Notes" .
	(lambda () (interactive)
		(open-file emacs-notes-file)
	)
  )
)

(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", f e i") '("Init" .
	(lambda () (interactive)
		(open-file lee-init-file)
	)
  )
)
