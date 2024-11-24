(evil-define-key '(normal emacs) 'evil-mode
  (kbd ", e")
  (cons "Emacs" (make-sparse-keymap))
)

(evil-define-key 'normal 'evil-mode
  (kbd ", e r")
  '("Restart" . restart-emacs)
)

(evil-define-key 'normal 'evil-mode
  (kbd ", e t")
  '("Time" . emacs-init-time)
)

(evil-define-key 'normal 'evil-mode
  (kbd ", e i")
  '("Init File" .	init-file-open)
)

(evil-define-key 'normal 'evil-mode
  (kbd ", e i")
  '("Init File" . init-file-open)
)

(evil-define-key 'normal 'evil-mode
  (kbd ", e l")
  '("Load File" . load-file)
)

(evil-define-key 'normal 'evil-mode
  (kbd "SPC x")
  '("M-x" . execute-extended-command)
)

(evil-define-key 'normal 'evil-mode
  (kbd "g k")
  '("M-x" . consult-buffer)
)

(evil-define-key 'normal 'evil-mode
  (kbd "C-b")
  '("Buffer Back" . previous-buffer)
)

(evil-define-key 'normal 'evil-mode
  (kbd "C-S-b")
  '("Buffer Forward" . next-buffer)
)

(evil-define-key 'normal 'evil-mode
  (kbd ", m r")
  '("Rainbow mode" . rainbow-mode)
)
