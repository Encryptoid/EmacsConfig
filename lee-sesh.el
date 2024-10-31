;(desktop-save-mode 1)
;(setq desktop-auto-save-timeout 1)

(setq desktop-globals-to-save
      '(desktop-missing-file-warning
        tags-file-name
        tags-table-list
        search-ring
        regexp-search-ring
        register-alist
        file-name-history
        kill-ring
        mark-ring
        global-mark-ring
        extended-command-history
        shell-command-history
        compile-history
        minibuffer-history
        read-expression-history
        last-kbd-macro
        kmacro-ring
        dired-regexp-history
        grep-history
        search-ring
        regexp-search-ring))

(setq desktop-save 'if-exists)
(setq desktop-load-locked-desktop t)
;(setq desktop-restore-frames nil)

(setq-default lee-sesh "~/.config/emacs-local/desktop/")
(defun sesh-save ()
  (interactive)
  (desktop-save lee-sesh)
  ;(message "Saved desktop file.")
  )

(defun sesh-load ()
  (interactive)
  (desktop-change-dir lee-sesh)
  (message "Loaded desktop file.")
  )

(advice-add 'levil-save :after #'sesh-save)

(evil-define-key 'normal 'evil-mode
  (kbd ", w l")
  '("Load Sesh" .
     (lambda () (interactive)
	   (sesh-load)
     )
  )
)
(evil-define-key 'normal 'evil-mode
  (kbd ", w s")
  '("Load Sesh" .
     (lambda () (interactive)
	   (sesh-save)
     )
  )
)


