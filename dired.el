(with-eval-after-load 'dired
  (evil-define-key 'normal
	dired-mode-map
	(kbd "<RET>")
	'dired-find-file)

  (evil-define-key 'normal
	dired-mode-map
	(kbd "gr")
	'revert-buffer)

  (evil-define-key 'normal
	dired-mode-map
	(kbd "<C-c>")
	(lambda () (interactive) (dired-copy-file-name-as-kill 0)))

  (evil-define-key 'normal
	dired-mode-map
	(kbd "<C-c>")
	(lambda () (interactive) (dired-copy-file-name-as-kill 0)))

  (evil-define-key 'normal dired-mode-map
	(kbd "dd") 'dired-do-delete)

	(evil-define-key 'normal dired-mode-map (kbd "-") 'dired-up-directory)

	(evil-define-key 'normal dired-mode-map (kbd "o") 'find-file)

	(evil-define-key 'normal dired-mode-map (kbd "O") 'make-directory)

	(evil-define-key 'normal dired-mode-map (kbd "!") 'dired-do-shell-command)

	(evil-define-key 'normal dired-mode-map (kbd "m") 'dired-create-directory)
  )

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e d")
  (lambda () (interactive) (dired default-directory)))

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e f")
  (lambda () (interactive) (dired cwd)))

(load-pack "nerd-icons")
(setq nerd-icons-scale-factor '1.3)
;(setq nerd-icons-scale-factor '2)
(setq all-the-icons-scale-factor '1.2)
(setq all-the-icons-scale-factor '2)
;;   

(add-hook 'dired-mode-hook
		  (lambda ()
			(dired-hide-details-mode 1)
			(dired-hide-details-mode 1)
			))

(load-pack "all-the-icons")
(load-pack "neotree")
(setq neo-window-width 35)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-show-hidden-files t)

;(neotree-dir "~/.config/emacs/")

;(use-package nerd-icons-dired
			;:ensure t
			;:hook (dired-mode . nerd-icons-dired-mode)
			;:config
			;;; https://github.com/rainstormstudio/nerd-icons-dired/blob/main/nerd-icons-dired.el
			;(load-pack "nerd-icons-dired")
			;)

(defface dired-lee-mask-face
  '((t :foreground "grey30"))
  "Remove 'lee-' from dired"
  :group 'dired-faces)

(defun dired-mask-lee ()
  "Mask part of the filename "
  (font-lock-add-keywords
   nil
   '(("\\(lee-\\)\\([^ \n]+\\)" 
      (1 'dired-lee-mask-face)))))

(add-hook 'dired-mode-hook 'dired-mask-lee)
