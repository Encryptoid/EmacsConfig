;; -*- lexical-binding: t -*-

(defun lister-workspace-action (ws)
  (message "Changing to Workspace: %s" (assoc 'Path ws))
  (dired (cdr (assoc 'Path ws)))
)

(defun lister-workspace-key (ws)
	;(message "key: %s" (assoc 'Name ws))
	(cdr (assoc 'Name ws))
)

(setq lister-template-workspace
  (make-list-template
    :name "Workspace"
		:action 'lister-workspace-action
		:new-tab nil
		:key 'lister-workspace-key
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
	(lister-consult lister-template-workspace)
)

;(lister-show-workspace)

(evil-define-key 'normal 'evil-mode
  (kbd "SPC l w")
  '("Lister Show Workspace" .
	lister-show-workspace
  )
)


