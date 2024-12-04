;; -*- lexical-binding: t -*-

(defun lister--new-tab ()
	"Sets new-tab bool for use on action"
  (interactive)
	;(message "Setting new-tab to true")
  (setf (lister-curr-new-tab lister-curr) t) 
  (setf (lister-curr-success lister-curr) t) 
  (exit-minibuffer)
)

(defun lister--new-keymap (lister)
	(interactive)
	(let (map (make-sparse-keymap))
    (evil-define-key 'insert minibuffer-local-map (kbd "C-t")	'lister--new-tab)
		(define-key minibuffer-local-map (kbd "C-<return>") 'lister--new-tab)

    (evil-define-key 'insert minibuffer-local-map (kbd "C-c n")
			(lambda ()
				(interactive)
				(run-at-time lister--v-minibuffer-exit-delay nil (lambda ()
														 (lister-new)))
				(exit-minibuffer)
			)
		)

    (evil-define-key 'insert minibuffer-local-map (kbd "C-c e")
			(lambda ()
				(interactive)
				(run-at-time lister--v-minibuffer-exit-delay nil (lambda ()
														 (lister-edit)))
				(exit-minibuffer)
			)
		)

    (evil-define-key 'insert minibuffer-local-map (kbd "C-c d")
			(lambda ()
				(interactive)
				(run-at-time lister--v-minibuffer-exit-delay nil (lambda ()
														 (lister-delete)))
				(exit-minibuffer)
			)
		)

    (evil-define-key 'insert minibuffer-local-map (kbd "C-c j")
			(lambda ()
				(interactive)
				(run-at-time lister--v-minibuffer-exit-delay nil
					(lambda () (lister-inc)
				    (run-at-time lister--v-minibuffer-exit-delay nil
							(lambda () (lister-consult (lister-curr-lister lister-curr) (lister-curr-sel lister-curr)))
						)
					)
				)
				(exit-minibuffer)
			)
		)

    (evil-define-key 'insert minibuffer-local-map (kbd "C-c k")
			(lambda ()
				(interactive)
				(run-at-time lister--v-minibuffer-exit-delay nil
					(lambda () (lister-dec)
				    (run-at-time lister--v-minibuffer-exit-delay nil
							(lambda () (lister-consult (lister-curr-lister lister-curr) (lister-curr-sel lister-curr)))
						)
					)
				)
				(exit-minibuffer)
			)
		)

	)
)
