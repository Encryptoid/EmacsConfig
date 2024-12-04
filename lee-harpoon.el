;; -*- lexical-binding: t -*-

(setq lee-harpoon-1 nil)
(setq lee-harpoon-2 nil)
(setq lee-harpoon-3 nil)
(setq lee-harpoon-4 nil)
(setq lee-harpoon-5 nil)

;; Set
(defun harpoon-set (index key-code)
	(message "Binding %s" key-code)
  (evil-define-key 'normal 'global (kbd key-code)
    (lambda ()
      (interactive)
      (let* ((var (intern (format "lee-harpoon-%d" index)))
             (file (buffer-file-name)))
        (set var file)
        (message "Harpoon - Set - %s - %s" (symbol-name var) (symbol-value var))
			)
		)
	)
)

;(lee-kbd "C-S-3")
;(lee-kbd "C-£")

(harpoon-set 1 (lee-kbd "C-S-1"))
(harpoon-set 2 (lee-kbd "C-S-2"))
;; TODO Change lee-kbd to lee-kbd-all that will get all C-S-3 mappings and map them
(harpoon-set 3 (lee-kbd "C-S-3"))
(harpoon-set 4 (lee-kbd "C-S-4"))
(harpoon-set 5 (lee-kbd "C-S-5"))

;; Go
(defun harpoon-go (index key-code)
  (evil-define-key 'normal 'global key-code
    (lambda ()
      (interactive)
      (let* ((var (intern (format "lee-harpoon-%d" index)))
						 (val (symbol-value var)))
					(unless (not (null val))
						(error "Harpoon - Error - %s not set" (symbol-name var)))
					(message "Harpoon - Go - %s - %s" (symbol-name var) (symbol-value var))
				  (find-file val)
			)
		)
	)
)

(harpoon-go 1 (kbd "C-1"))
(harpoon-go 2 (kbd "C-2"))
(harpoon-go 3 (kbd "C-3"))
(harpoon-go 4 (kbd "C-4"))
(harpoon-go 5 (kbd "C-5"))

