(require 'package)
;(add-to-list
  ;'package-archives
  ;'("melpa" . "https://melpa.org/packages/")
;)
(package-initialize)
; (package-refresh-contents)

(setq emacs-packages "~/.config/emacs-packages")

(defun load-all-packs (dir)
  (let ((files (directory-files dir t "^[^.]+")))
    (dolist (file files)
      (when (and (file-regular-p file) (string-match-p "\\.el$" file))
        (message "Loading file: %s" file)
        ;(load file)
				)
	  )
	)
  )

;(load-all-packs "~/.config/emacs-packages/modus-themes")
;(setq-default custom-theme-directory "/home/l/.config/emacs-packages/modus-themes/")

;; TODO Not working
(defun load-theme-pack (name)
	(interactive)
	(let ((pck-dir (expand-file-name (concat emacs-packages "/" name "/"))))
		(message "Loading: %s" pck-dir)
    (add-to-list 'custom-theme-load-path pck-dir)
	)
)

(defun load-pack (name &optional req-name)
  (interactive)
  (let ((pck-dir (expand-file-name (concat emacs-packages "/" name "/"))))
		(message "Loading: %s" pck-dir)
    (add-to-list 'load-path pck-dir)
    (if (eq req-name nil)
			  (require (intern name))
        (if (string= req-name "*")
          (load-all-packs pck-dir)
          (require (intern req-name))
			  )
    )
	)
)

(setq lee-emacs-conf-dir "/home/l/.config/emacs/")
(defun load-conf (file)
	(interactive)
	(let ((path (concat lee-emacs-conf-dir file)))
		(load-file path)
		(message "Loaded File: %s" path)
	)
)

;; Testing
;(load-pack "modus-themes")
;(load-pack "modus-themes" "invalid-kjkdslajfklashd")
;(load-pack "modus-themes" "modus-vivendi-theme")
;(load-pack "modus-themes" "*")


