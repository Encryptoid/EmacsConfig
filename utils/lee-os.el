(defun to-clip (val) (interactive "Write to clipboard")
  (kill-new val)
	(message "Copied to clipboard: %s" val)
)
