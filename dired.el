(with-eval-after-load 'dired
  (evil-define-key 'normal
	dired-mode-map
	(kbd "<RET>")
	'dired-find-file)


  (evil-define-key 'normal
	dired-mode-map
	(kbd "<C-c>")
	(lambda () (interactive) (dired-copy-file-name-as-kill 0)))

  (evil-define-key 'normal
	dired-mode-map
	(kbd "<C-c>")
	(lambda () (interactive) (dired-copy-file-name-as-kill 0)))

  (evil-define-key 'normal dired-mode-map (kbd "dd") 'dired-do-delete)

	(evil-define-key 'normal dired-mode-map (kbd "-") 'dired-up-directory)

	(evil-define-key 'normal dired-mode-map (kbd "o") 'find-file)

	(evil-define-key 'normal dired-mode-map (kbd "O") 'make-directory)

	(evil-define-key 'normal dired-mode-map (kbd "!") 'dired-do-shell-command)
  
	(evil-define-key 'normal dired-mode-map (kbd "y") 'dired-do-copy) ;; TODO Write Copy File to clipboard os script

	(evil-define-key 'normal dired-mode-map (kbd "C-c") (lambda () (interactive) (to-clip (dired-get-file-for-visit))))
)

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e f")
  (lambda () (interactive) (dired default-directory)))

(evil-define-key 'normal 'evil-mode (kbd "<SPC> e a")
  (lambda () (interactive) (neotree-toggle)))

(load-pack "nerd-icons")
(setq nerd-icons-scale-factor '1)
;(setq nerd-icons-scale-factor '2)
(setq all-the-icons-scale-factor '1)
;(setq all-the-icons-scale-factor '2)
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
(setq delete-by-moving-to-trash t)

;(neotree-dir "~/.config/emacs/")

;(use-package nerd-icons-dired
			;:ensure t
			;:hook (dired-mode . nerd-icons-dired-mode)
			;:config
			;;; https://github.com/rainstormstudio/nerd-icons-dired/blob/main/nerd-icons-dired.el
			;(load-pack "nerd-icons-dired")
			;)

(load-pack "nerd-icons-dired")
(nerd-icons-dired-mode t)
(add-hook 'dired-mode-hook 'nerd-icons-dired-mode)

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
(add-hook 'dired-mode-hook 'auto-revert-mode)

(setq dired-listing-switches "-al --time-style=long-iso")
