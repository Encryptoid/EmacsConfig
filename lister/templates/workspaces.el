;; -*- lexical-binding: t -*-

(defun lister-workspace-action (ws)
  (message "Changing to Workspace: %s" (assoc 'Path ws))
  (dired (cdr (assoc 'Path ws)))
)

(setq lister-template-workspace
  (make-list-template
    :name "Workspace"
		:action 'lister-workspace-action
		:new-tab nil
    :fields (list
      (make-field-template :name "Name" :type 'str)
      (make-field-template :name "Shortcut" :type 'str)
      (make-field-template :name "Path" :type 'dir)
      ;(make-field-template :name "Path" :type 'str :preview t :init (lambda () (read-directory-name "Select directory: ")))
      ;(make-field-template :name "Active" :type 'bool)
    )
  )
)

(defun lister-show-workspace ()
  (interactive)
  (let ((current-tab (tab-bar--current-tab-index)))
	  (lister-consult lister-template-workspace)
	)
)

(evil-define-key 'normal 'evil-mode
  (kbd "SPC l w")
  '("Lister Show Workspace" .
	lister-show-workspace
  )
)


