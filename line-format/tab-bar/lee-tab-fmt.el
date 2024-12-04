;; -*- lexical-binding: t -*-

(defun my-combined-face (base-bg-face base-fg-face new-face)
  "Create NEW-FACE using the background from BASE-BG-FACE and the foreground from BASE-FG-FACE."
  (let ((bg (face-attribute base-bg-face :background nil 'default))
        (fg (face-attribute base-fg-face :background nil 'default)))
    (set-face-attribute new-face nil
                        :background bg
                        :foreground fg
												:weight 'extra-bold
												:height 1.2)))

(setq tab-bar-separator icon-line-hor)
(defface tab-line-bg-blank nil "")
(my-combined-face 'tab-line-bg-6 'tab-line-bg-1 'tab-line-bg-blank)

(defface tab-line-bg-inactive nil "")
(set-face-attribute 'tab-line-bg-inactive nil
										:background (face-attribute 'tab-line-bg-6 :background nil 'default)
										:foreground "11F"
										:height 1.0
										:weight 'normal
										:box '(:line-width 0.1))

(defface tab-line-bg-active nil "")
(set-face-attribute 'tab-line-bg-active nil
										:background (face-attribute 'tab-line-bg-1 :background nil 'default)
										:foreground (face-attribute 'tab-line-bg-1 :foreground nil 'default)
										:height 1.1
										:weight 'bold
										:width 'ultra-expanded
										:box nil)

(defun tab-bar--fmt (tab index)
  (let* ((current-p (eq (car tab) 'current-tab))
         (name (alist-get 'name tab))
         (key (alist-get 'key tab))
				 (workspace (tab--get-metadata "workspace" tab))
				 )
		;(message "curre: %s" current-p)
		(let* ((face (if current-p 'tab-line-bg-active 'tab-line-bg-inactive)))
		  (concat
			 (propertize
							 (format icon-div-left)
								'face 'tab-line-bg-blank)
		    (propertize (format (concat " %d - %s - %s ")
								  index
								  ;(concat "[ " icon-planet " " (or workspace "Emacs Config") " ]" )
								  ;(concat "[ " (or name "Emacs Config") " " icon-file-emp " ]" )
								  (concat "[ " (or workspace "Emacs Config") " " icon-planet " ]" )
								  (concat "[ " icon-file-emp " " (or name "Emacs Config") " ]" )
									)
								  'face face
			  )
			 (propertize
							 (format icon-div-right)
								'face 'tab-line-bg-blank)
		  )
		)
	)
)

(setq tab-bar-tab-name-format-function #'tab-bar--fmt)

(setq tab-bar-auto-width t)

