;(defun create-project (name git-url)
  ;`(("name" . ,name)
    ;("git" . ,git-url)
	;)
;)
;
;(defvar project-list
  ;`(
	;("CCL" . ,(create-project
		;("Name" . "CCL")
		;("Git" . "https://www.youtube.com/")
	;))
 	;("PV" . ,(create-project
		;("Name" . "Pricing Viewer")
		;("Git" . "https://github.com/")
	;))
 ;)
;)
;
;(defun get-value (key alist)
  ;(interactive)
  ;(let ((result (cdr (assoc key alist))))
    ;(if (symbolp result)
        ;(symbol-value result)
      ;result)))
;
;(message "%s" (get-value "name" (get-value "PV" project-list)))
;
;(defvar test "hi2")
;(message "%s" test)
;
;(load-pack "dash")
;(load-pack "ts")
;(load-pack "s")
;(load-pack "peg")
;(load-pack "org-ql")
;(require 'org-ql)
;
;;(lee-fzf-list project-list 'fmt-fun)
;
;
;(defun tasker-create-project (name name2)
  ;(interactive "sProject Name: \nsProject Name 2: ")
  ;(message "Name 1: %s, Name 2: %s" name name2)
;)

(cl-defstruct field-template
  field-name
  field-type
  init
)

(cl-defstruct list-template
  name
  fields
)
;(read-directory-name "Select directory: ")


(setq todo-template
	(make-list-template
	:name "Workspaces"
	:fields (list
			 (make-field-template :field-name "Name" :field-type 'string :init t)
			 (make-field-template :field-name "Shortcut" :field-type 'string :init t)
			 (make-field-template :field-name "Path" :field-type 'string
								  :init (lambda () (read-directory-name "Select directory: ")))
			)
	)
)

(defun handle-field (field)
  "Handle user input or function call for FIELD based on `is-init` property."
  (let ((field-name (field-template-field-name field))
        (field-init (field-template-init field)))
    (cond
     ((functionp field-init)
      (funcall field-init))
     (field-init
      (read-from-minibuffer (format "Enter %s: " field-name))
	 )
     (t "")
	)
  )
)

(require 'lee-json)

(defun create-record (template)
  "Prompt user to create a new record based on TEMPLATE."
  (let ((record (make-hash-table :test 'equal)))
    (dolist (field (list-template-fields template))
      (let ((value (handle-field field)))
        (when value
          (puthash (field-template-field-name field) value record))))
    record
  )
)

(create-record todo-template)

(defun my-consult-custom-list (list format-fn)
  "Display LIST with consult and return the original value on selection."
  (let* ((candidates (mapcar (lambda (entry)
                               (cons (funcall format-fn entry) entry))
                             list))
         (selected (consult--read (mapcar #'car candidates)
                                  :prompt "Select: "
                                  :sort nil
                                  :require-match t)))
    (cdr (assoc selected candidates)))
)

(setq sample-list-2 '(("Item1" . "Description1")
                      ("Item2" . "Description2")
                      ("Item3" . "Description3")))

;(my-consult-custom-list sample-list-2
                    ;(lambda (item) (format "%s: %s" (car item) (cdr item)))
;)

(require 'consult)
(setq consult-preview-key 'any)  ;; Set this to preview at every selection (or choose a keybinding)

(setq vertico-buffer-display-action
	  '(display-buffer-reuse-window)
)

(defun test-consult ()
  "Select an item from `my-custom-list` with `consult`."
  (interactive)
  (consult--read
   sample-list-2
   :prompt "Select an item: "
   :sort nil ;; Disable sorting if you want to maintain original order
   :require-match t
   :category 'custom
   :history 'my-consult-custom-list-history
:state (lambda (_action selection)
		 (message "%s" _action)
            (when (eq _action 'return)  ;; Trigger on final selection
              (message "You selected: %s" selection)))
   )
  )

(defvar my-custom-list
  '(("Item 1" . "Preview for Item 1")
    ("~/notes/commands.md" . "Preview for Item 2")
    ("Item 3" . "Preview for Item 3")
    ("Item 4" . "Preview for Item 4"))
  "A custom list of items with previews for consult."
)

(defun my-custom-preview-function (_action selection)
  (interactive)
  (let ((preview (assoc-default selection my-custom-list)))
    (cond
     ((eq _action 'preview)
      (when preview
        (with-current-buffer (get-buffer-create "*Custom Preview*")
          (erase-buffer)
          (insert preview)
			(display-buffer (current-buffer)
			  '((display-buffer-use-some-window)
				  (inhibit-same-window . t)
				  (window-height . 0.4))))))
     ((eq _action 'return)
      (when (get-buffer "*Custom Preview*")
        (kill-buffer "*Custom Preview*"))))))

(defun my-consult-custom-list-with-preview ()
  "Select an item from `my-custom-list` with preview."
  (interactive)
  (consult--read
   (mapcar #'car my-custom-list) ;; List of items for selection
   :prompt "Select an item: "
   :sort nil
   :require-match t
   :category 'custom
   :state #'my-custom-preview-function
  )
)

