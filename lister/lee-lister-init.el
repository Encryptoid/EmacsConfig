;; -*- lexical-binding: t -*-

(load-conf "lister/lee-lister-structs.el")
(load-conf "lister/lee-lister-input.el")
(load-conf "lister/lee-lister-fmt.el")
(load-conf "lister/lee-lister-new.el")
(load-conf "lister/lee-lister-keys.el")
(load-conf "lister/lee-lister-edit.el")
(load-conf "lister/lee-lister-inc.el")
(load-conf "utils/lee-json.el")
 
(setq lister-dir "/home/l/.config/emacs-local/lister/")

(defun lister--make-new-tab (lister item)
	(tab-bar-new-tab)
)

(defun lister--action-wrap (lister selection fmt-map)
	(interactive)
	(let ((action (list-template-action lister)))
		(when-let ((item (cdr (assoc selection fmt-map))))
			(when (and (lister-curr-success lister-curr) (lister-curr-new-tab lister-curr))
				(lister--make-new-tab lister item))
			(when (lister-curr-success lister-curr) (funcall action item))
		)
	)
)

(defun lister--json-name (lister)
	(concat lister-dir (list-template-name lister) ".json")
)
(let ((tabs (tab-bar-tabs)))
  (dolist (tab tabs)
    (message "Full tab structure: %s" tab)))

;(lee-json-read (lister--file-name lister-template-workspace))

(defun add-temp-hook (hook func)
  "Add FUNC to HOOK as a temporary hook.
FUNC will run once and remove itself from HOOK."
  (let ((wrapper-func nil))
    (setq wrapper-func
          (lambda (&rest args)
            (apply func args)
            (remove-hook hook wrapper-func)))
    (add-hook hook wrapper-func)))

(defvar lister-curr nil)

(defun lister--state (act selection)
	;(message "Action: %s Return: %s" act selection)
	(when (and (eq act 'preview) (not (eq selection nil)))
		(setf (lister-curr-sel lister-curr) selection)
		)
	(when (eq act 'return)
		(when (not (eq nil selection))
			(message "working: %s" selection)
			(setf (lister-curr-success lister-curr) t))
		(lister--action-wrap (lister-curr-lister lister-curr) (lister-curr-sel lister-curr) (lister-curr-fmt-map lister-curr))
	)
)

(defun lister-consult (lister &optional default-val)
	(interactive)
  (let* ((map (make-sparse-keymap))
         (path (lister--json-name lister))
				 (curr-tab (tab-bar--current-tab-index))
         (list (lee-json-read path))
				)
  		(setq lister-curr (make-lister-curr :lister lister :new-tab (list-template-new-tab lister) :list list))
		(let* (
					 (fmt-map (lister-fmt-map lister list)))
			(setf (lister-curr-sel lister-curr) list)
			(setf (lister-curr-fmt-map lister-curr) fmt-map)
      (consult--read
         (nreverse (mapcar #'car fmt-map))
         :prompt (format "Select %s: " (list-template-name lister))
         :sort nil
         :require-match t
         :category 'custom
         ;:history 'my-consult-custom-list-history
         ;:default default-val
			   :keymap (lister--new-keymap lister)
				 :preview-key 'any
         :state 'lister--state
	    )
		)
	)
)

(load-conf "lister/templates/lee-lister-templates-init.el")
