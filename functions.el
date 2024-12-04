(setq-default lee-init-file "~/.config/emacs/lee-init.el")
(defun init-file-open ()
  (interactive)
  (find-file lee-init-file)
)

(defun init-file-load ()
  (interactive)
  (load-file lee-init-file)
)

(defun test-fun () (interactive) (message "Testing!"))

(defun str (n)
  "Convert the number N to a string."
  (number-to-string n))

