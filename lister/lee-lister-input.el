(defun lister-read-bool (name)
  (consult--read
   (mapcar #'car '(("True") ("False"))) ;; List of items for selection
   :prompt (format "Select %s: " name)
   :sort nil
   :require-match t
   :category 'custom
   :state #'my-custom-preview-function
  )
)

(defun lister-user-input (name type init &optional prompt-fmt)
  (if (functionp init)
	(funcall init)
	  (cond
		((eq init nil) "No value")
		((functionp init) (funcall init))
		((eq init t) 
	  	(cond
		  ((eq type 'str)
            ;(read-from-minibuffer (format "Enter %s: " name))
		   (completing-read (format (or prompt-fmt "Enter %s: ") name) nil)
		  )
		  ((eq type 'dir)
            (read-directory-name (format "Select %s: " name))
		  )
		  ((eq type 'bool)
		   (lister-read-bool name)
		  )
		)
	  )
	)
  )
)
