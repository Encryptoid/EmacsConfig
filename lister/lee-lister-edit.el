;; -*- lexical-binding: t -*-

(defun lister-edit--state (act sel)
	(interactive)
	(when (eq act 'return)
		(let* (
		  (lister (lister-curr-lister lister-curr))
			(fields (list-template-fields lister))
      (field (cl-find sel fields :key #'field-template-name :test #'string=))
			(name (field-template-name field))
			(type (field-template-type field))
			(init (field-template-init field))
			(fields (list-template-fields lister))
			(match (cdr (assoc (lister-curr-sel lister-curr) (lister-curr-fmt-map lister-curr))))
			(old (assoc (intern name) match))
			(new-val (lister-user-input name type init (format "Change %s: %s -> " name (cdr old))))
		)
			(setcdr old new-val)
			;; TODO Json not writing here. Add log to here and lister-new and compare
		  (lee-json-write (lister-curr-list lister-curr) (lister--json-name lister))
			(message "name: %s, old: %s" name (lister-curr-list lister-curr))
		)
	)
)

		  ;;(lee-json-write (list) "/home/l/.config/emacs-local/lister/Workspace2.json")

(defun lister-edit ()
	(interactive)
	(let* (
		    (lister (lister-curr-lister lister-curr))
				(fields (list-template-fields lister))
			  (match (cdr (assoc (lister-curr-sel lister-curr) (lister-curr-fmt-map lister-curr))))
				(ret (list))
			)
		(dolist (field fields)
						(message "%s" field)
						(push (field-template-name field) ret)
						)
		(let ((sel-field
					 (consult--read ret
													:prompt "Edit: "
													:state 'lister-edit--state
						)))
			(message "sel: " sel-field)
			)
		ret
	)
)

