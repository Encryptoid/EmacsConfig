(setq server-port 9000)
(load-file "~/.config/emacs/lee-packages.el")
(load-file "~/.config/emacs/setup.el")
(load-file "~/.config/emacs/which-key.el")

(load-file "~/.config/emacs/line-format.el")
(load-file "~/.config/emacs/appearance.el")
(load-file "~/.config/emacs/evil/init.el")
(load-file "~/.config/emacs/dired.el")

;; Must come after evil for saving feature
(load-file "~/.config/emacs/lee-sesh.el")

;; Handy keybinds
(load-file "~/.config/emacs/lee-files.el")

(load-file "~/.config/emacs/functions.el")
(load-file "~/.config/emacs/fzf.el")

(setq-default cwd "~/.config/emacs/")

(init-file-open)

(server-start)
