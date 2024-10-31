;(evil-define-key '(normal) 'global-map (kbd "SPC SPC") 'execute-extended-command)
(defun levil-save ()
  (interactive)
	(save-some-buffers t)
	(message "Saved.")
  )

(evil-define-key '(normal) 'global-map
  (kbd "SPC SPC")
  'levil-save
)

(evil-define-key '(normal) 'special-mode-map (kbd "q") '(quit-window))