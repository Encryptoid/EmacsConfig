;; https://github.com/bling/fzf.el
(load-pack "fzf")
(use-package fzf
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        fzf/grep-command "rg --no-heading -nH"
        ;; fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 50)
  )

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f d") (lambda () (interactive) (fzf-find-file cwd)))

;(evil-define-key 'normal 'evil-mode
;  (kbd "g l") 'fzf-recentf)

(evil-define-key 'normal 'evil-mode
  (kbd "gl")
  '("Ripgrep cwd" .
     (lambda () (interactive)
	   (counsel-fzf "" cwd "")
     )
  )
)

(recentf-mode t)
;(fzf-find-file cwd)

(defun fzf-dir (dir)
  (fzf-with-entries
	(seq-remove (lambda (file) (member file '("." "..")))
				(directory-files dir))
   'find-file))

;; https://github.com/abo-abo/swiper
(load-pack "ivy")
(load-pack "ivy" "counsel")
(ivy-mode t)

;; https://github.com/tumashu/posframe
;; https://github.com/tumashu/ivy-posframe
(load-pack "posframe")
(load-pack "ivy-posframe")
(ivy-posframe-mode t)
(setq ivy-posframe-height-alist '((swiper . 20)
                                  (t      . 40)))

;; https://github.com/minad/consult
(load-pack "compat")
(load-pack "consult")
;(counsel-mode)

(defun test-rg (&optional input dir)
  (interactive)
  (let ((process-environment
		 (cons (concat "FZF_DEFAULT_COMMAND=rg -5n --files --no-follow --hidden")
			   process-environment)))
	(counsel-fzf input dir))
  )
;(test-rg "evil" "~/.config/emacs/")
;(counsel-rg "" "~/.config/emacs/" "--hidden --no-follow")

;; ESC to exit minibuffer
(evil-define-key 'normal ivy-minibuffer-map [escape]
  'minibuffer-keyboard-quit)
 
(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f j")
  '("Ripgrep cwd" .
     (lambda () (interactive)
	   (counsel-rg "" cwd "")
     )
  )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f f")
  '("Ripgrep cwd" .
     (lambda () (interactive)
	   (counsel-rg "" cwd "")
     )
  )
)

;(fzf-grep-in-dir "~/.config/emacs" t "your-file-pattern")
