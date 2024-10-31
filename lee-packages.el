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
        (load file))
	  )
	)
  )

(defun load-pack (name &optional req-name)
  (interactive)
  (let ((pck-dir (expand-file-name (concat emacs-packages "/" name))))
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

;; Testing
;(load-pack "modus-themes")
;(load-pack "modus-themes" "invalid-kjkdslajfklashd")
;(load-pack "modus-themes" "modus-vivendi-theme")
;(load-pack "modus-themes" "*")


