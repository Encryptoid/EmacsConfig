(cl-deftype enum-field-type ()
  '(member str bool file dir)
)

(cl-defstruct field-template
  name
  (type :type my-enum-type)
  (preview 't)
  (init t)
	(display t)
)

;; (setq tester (make-field-template :name "Test" :type 'str :preview t))
;; (setf (field-template-name tester) "Lee")
;; 
;; (message "%s" (field-template-name tester))

(cl-defstruct list-template
  name
  fmt
  action
	(new-tab 'nil)
	key
  fields
	binds
)

(cl-defstruct lister-curr
	lister
	list
  sel
	fmt-map
	(new-tab 'nil)
	(success nil)
)
