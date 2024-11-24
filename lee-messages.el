(setq lee-messages-monitor lee-monitor-3)

(defun lee-messages--launch (m-name)
	(select-frame (make-frame-on-monitor lee-messages-monitor))
	(set-frame-parameter (selected-frame) 'fullscreen 'maximized) ;; 'fullboth for true fullscreen
  (switch-to-buffer m-name)
)

(defun lee-messages--switch (m-name)
	(let* (
			(curr-frame (selected-frame))
		  (m-win (get-buffer-window m-name t))
			(m-frame (window-frame m-win))
		)
		(if m-win
			(progn
				(select-frame-set-input-focus m-frame)
				(with-current-buffer m-name
					(goto-char (point-max))
					(recenter)
				)
        ;(select-frame-set-input-focus curr-frame)
			)
		)
	)
)

(defun lee-messages-buffer ()
	(interactive)
	(let* (
		  (m-name "*Messages*")
		  (m-win (get-buffer-window m-name t))
	  )
		(if m-win
				(lee-messages--switch m-name)
			  (lee-messages--launch m-name)
		)
	)
)

(evil-define-key 'normal 'global (kbd ", e m") 'lee-messages-buffer)
(evil-define-key 'normal messages-buffer-mode-map (kbd ", b") (lambda () (interactive) (other-frame -1)))

(defun lee-messages-clear ()
  "Clear the *Messages* buffer."
  (interactive)
  (with-current-buffer "*Messages*"
    (let ((inhibit-read-only t)) ;; Temporarily allow modifications
      (erase-buffer)
		)
		(setq buffer-read-only t)
		(message "Cleared *Messages* buffer.")
	)
)
(evil-define-key 'normal messages-buffer-mode-map (kbd ", c") 'lee-messages-clear)
