;; Files
(setq backup-directory-alist '((".*" . "~/temp/emacs/backup-files/")))
(setq custom-file "~/.emacs.d/custom-vars.el")

;; Frame
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(left . 2000))
(add-to-list 'default-frame-alist '(undecorated . t))

;(setq initial-buffer-choice 'lee-init-file)
(setq inhibit-startup-screen t)
(setq initial-buffer-choice nil)
(setq inhibit-x-resources nil)
(setq window-combination-resize t)

(menu-bar-mode 0) 
(tool-bar-mode 0)
(fringe-mode 0)

(scroll-bar-mode 0)
(toggle-scroll-bar 0) 

(setq-default header-line-format mode-line-format)
;(setq mode-line-format nil)


;; Modes
(setq auto-save-interval 1)
(auto-save-mode 1)

(setq history-length 30)
(savehist-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(save-place-mode 1)

;(setq-default indent-tabs-mode t)
(setq-default tab-always-indent nil)
(setq-default tab-width 2)

(setq visible-bell nil)
;(set-message-beep 'silent)
(setq ring-bell-function #'ignore)
(setq read-file-name-completion-ignore-case t)

(display-line-numbers-mode 1)
(setq-default display-line-numbers 'relative)

