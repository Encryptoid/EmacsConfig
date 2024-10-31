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

	(evil-define-key 'normal dired-mode-map (kbd "!") 'dired-do-shell-command)

	(evil-define-key 'normal dired-mode-map (kbd "m") 'dired-create-directory)
  )

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e d")
  (lambda () (interactive) (dired default-directory)))

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e f")
  (lambda () (interactive) (dired cwd)))

(add-hook 'dired-mode-hook
		  (lambda ()
			(dired-hide-details-mode 1)
			(dired-hide-details-mode 1)
			))

(use-package nerd-icons-dired
			:ensure t
			:hook (dired-mode . nerd-icons-dired-mode)
			:config
			;; https://github.com/rainstormstudio/nerd-icons-dired/blob/main/nerd-icons-dired.el
			(load-pack "nerd-icons-dired")
			)
