;; -*- lexical-binding: t -*-

(defun lister-workspace-action (ws)
  (message "Changing to Workspace: %s" (assoc 'Path ws))
  (dired (cdr (assoc 'Path ws)))
  (tab--add-metadata "workspace" (cdr (assoc 'Name ws)))
)

(defun lister-workspace-key (ws)
	;(message "key: %s" (assoc 'Name ws))
	(cdr (assoc 'Name ws))
)

(defun lister-workspace-binds ()
  ;(evil-define-key 'insert minibuffer-local-map (kbd "C-t")	(lambda () (lister--new-tab)))
)

(setq lister-template-workspace
  (make-list-template
    :name "Workspace"
		:action 'lister-workspace-action
		:new-tab t
		:key 'lister-workspace-key
		:binds 'lister-workspace-binds
    :fields (list
      (make-field-template :name "Name" :type 'str)
      (make-field-template :name "Shortcut" :type 'str :display nil)
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


