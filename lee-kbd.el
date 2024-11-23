(defvar lee-uk-us-map
  '((US . (
					 ("C-S-1" . "C-!")
					 ("C-S-2" . "C-@")
           ("C-S-3" . "C-#")
           ("C-S-4" . "C-$")
           ("C-S-5" . "C-%")
					))
    (UK . (
					 ("C-S-1" . "C-!")
					 ("C-S-2" . "C-\"")
           ("C-S-3" . "C-£")
           ("C-S-4" . "C-$")
           ("C-S-5" . "C-%")
					 ))
	 )
  "Keyboard mappings for UK and US layouts."
)

(defvar lee-kbd-layout 'UK
  "Current keyboard layout. Can be either 'us or 'uk."
)

(defun lee-kbd (logical-key)
  "Get the actual keybinding for LOGICAL-KEY based on the current layout."
  (let* ((layout-map (cdr (assoc lee-kbd-layout lee-uk-us-map)))
         (key (cdr (assoc logical-key layout-map))))
    (message "Resolved key for %s: %s" logical-key (or key logical-key))
    (kbd (or key
						 logical-key
             ;(error "Key %s not defined for layout %s" logical-key lee-kbd-layout))
				 )
		)
	)
)

(defun lee-switch-kbd (layout)
  "Switch to the specified keyboard LAYOUT ('us or 'uk)."
  (unless (member layout '(US UK))
    (error "Invalid layout: %s" layout))
  (setq lee-kbd-layout layout)
  (message "Switched to %s keyboard layout" layout)
)

(defun us ()
  "Switch to US keyboard layout."
  (interactive)
  (lee-switch-kbd 'US)
)

(defun uk ()
  "Switch to UK keyboard layout."
  (interactive)
  (lee-switch-kbd 'UK)
)
