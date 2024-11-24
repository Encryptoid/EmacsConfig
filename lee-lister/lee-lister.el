(defun lister-new (list)
  (let* (
	  (existing (lee-json-read lister-workspace-json))
    (new-record (list (mapcar (lambda (item)
	    (cons (field-template-name item)
		    (get-user-input
		    (field-template-name item)
		    (field-template-type item)
		    (field-template-init item)
		    )
	    ))
	    (list-template-fields list)
    )))
  )
  (if (null existing) new-record (append existing new-record))
  )
)

(defun lister-workspace-new ()
  (interactive)
  (lee-json-write (lister-new lee-list-workspace) lee-workspace-json-file)
)
(lister-workspace-new)




