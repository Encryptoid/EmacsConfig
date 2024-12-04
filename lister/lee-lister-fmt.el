;; -*- lexical-binding: t -*-

(defun get-kv-maxs (templ list)
  (interactive)
	(let ((maxs (make-hash-table :test 'equal)))
		(dolist (field (list-template-fields templ))
			(dolist (rec (append list nil))
				(let* (
							 (field-key (intern (field-template-name field)))
							 (rec-val (cdr (assoc field-key rec)))
							 (existing-max (if (gethash field-key maxs) (gethash field-key maxs) 0))
							 )
				  (when (and (stringp rec-val) t)
				    (let ((rec-len (length rec-val)))
							(when (> (length rec-val) existing-max)
								;(message "len %s longer than max %s" rec-val existing-max)
							  (puthash field-key rec-len maxs)
							)
					  )
				  )
				)
			)
		)
		maxs
	)
)

;(get-kv-maxs lister-template-workspace
  ;(lee-json-read "/home/l/.config/emacs-local/lister/Workspace.json"))

(defun str-rpad (str max)
	(if (>= (length str) max)
		str
		(concat str (make-string (- max (length str)) ?\s))
	)
)

(defun lister-fmt-map (templ list)
	(interactive)
	(let* (
				  (maxs (get-kv-maxs templ list))
					(fmts '())
		      (lister (lister-curr-lister lister-curr))
          (fields (list-template-fields lister))
				)
	  (dolist (rec list)
			(let ((rec-str ""))
			  (dolist (kv rec)
					(let ((val-fmt (str-rpad (cdr kv) (gethash (car kv) maxs))))
					  (if (field-template-display (seq-find (lambda (field) (string= (car kv) (field-template-name field))) fields))
					    (if (string= "" rec-str)
							    (setq rec-str (format "[ %s ]" val-fmt))
						      (setq rec-str (concat rec-str (format " - [ %s ]" val-fmt)))
					    )
					  )
					)
			  )
				(push (cons rec-str rec) fmts)
			)
		)
		fmts
	)
)

;(lister-fmt lister-template-workspace
  ;(lee-json-read "/home/l/.config/emacs-local/lister/Workspace.json"))
