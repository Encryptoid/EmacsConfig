;; Setup
(load-file "~/.config/emacs/lee-packages.el")
(load-file "~/.config/emacs/setup.el")
(load-file "~/.config/emacs/which-key.el")

;; Utils
(load-file "~/.config/emacs/lee-kbd.el")
(us)
(load-file "~/.config/emacs/utils/lee-json.el")

;; Evil
(load-file "~/.config/emacs/evil/init.el")

;; Appearance
(load-file "~/.config/emacs/line-format.el")
(load-file "~/.config/emacs/appearance.el")

;; Emacs
(load-file "~/.config/emacs/dired.el")
(load-file "~/.config/emacs/lee-emacs.el")
(load-file "~/.config/emacs/functions.el")
(load-file "~/.config/emacs/text-edit/lee-edit-init.el")

;; Must come after evil for saving feature
(load-file "~/.config/emacs/lee-sesh.el")

;; Handy keybinds
(load-file "~/.config/emacs/lee-files.el")

;; Custom Plugins
(load-file "~/.config/emacs/fzf.el")
(load-file "~/.config/emacs/completion.el")
(load-file "~/.config/emacs/lee-harpoon.el")

(setq-default cwd "~/.config/emacs/")
;
; (init-file-open)
; (sesh-load)
;
; (setq server-port 9000)
; (server-start)
; (message "%s" (emacs-init-time))
; (setq which-key-show-remaining-keys nil) ;; Not working?
