(cl-deftype enum-field-type ()
  '(member str bool file dir)
)

(cl-defstruct field-template
  name
  (type :type my-enum-type)
  (preview 't)
  (init 't)
)

;; (setq tester (make-field-template :name "Test" :type 'str :preview t))
;; (setf (field-template-name tester) "Lee")
;; 
;; (message "%s" (field-template-name tester))

(cl-defstruct list-template
  name
  fmt
  action
  fields
	new-tab
)