(setq-default lee-init-file "~/.config/emacs/lee-init.el")
(defun init-file-open ()
  (interactive)
  (find-file lee-init-file)
)

(defun init-file-load ()
  (interactive)
  (load-file lee-init-file)

)
