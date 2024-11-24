;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Mode-Line-Variables.html

(defun get-active-header (buf)
  (concat
   (format "[ %s ]" buf)
   " - "
   (format "[ %s ]" major-mode)
   ;" = Active = "
))

(defun get-inactive-header (buf)
  (concat
   ;(format "[ %s ]" (or buffer-file-name buf)
   (format "[ %s ]" buf)
)
  )

(defun set-inactive-header ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (setq header-line-format (get-inactive-header buf)))))

(defun set-active-header (window)
  (with-current-buffer (window-buffer (selected-window))
    (setq header-line-format (get-active-header (window-buffer (selected-window))))))

(defun set-header-line (_window)
  (set-inactive-header)
  (set-active-header _window))
(setq-default header-line-format nil)
;(add-hook 'window-selection-change-functions #'set-header-line)

(defun get-mode-line ()
  (concat
   "[ %f ]"
   " - "
	"[ Line: %l, Char: %C ]"
   )
  )
(setq mode-line-format (get-mode-line))


(defface my-tab-bar-face
  '((t))
  "Custom face for tab-bar formatting.")
(set-face-attribute 'my-tab-bar-face nil
                    :weight 'bold
                    :foreground "#56992d")


(setq tab-bar-separator "    ")
(message (format "%s" (length (tab-bar-tabs))))

(setq tab-bar-time-fmt-sec "%H:%M:%S")
(setq tab-bar-time-fmt-min "%H:%M")
(setq tab-bar-date-fmt "%A - %b %d")
(setq tab-bar-time-fmt tab-bar-time-fmt-min)

(setq tab-bar-refresh-sec 5)
(setq show-seconds nil)

(defun seconds ()
  (interactive)
  (if show-seconds
      (progn
		(message "Hiding seconds")
        (setq show-seconds nil)
        (setq tab-bar-time-fmt tab-bar-time-fmt-min)
	    (setq tab-bar-refresh-sec 5)
		)
    (progn
	  (message "Showing seconds")
      (setq show-seconds t)
      (setq tab-bar-time-fmt tab-bar-time-fmt-sec)
	  (setq tab-bar-refresh-sec 0.5)
	)
  )
)

(message (format "%s" show-seconds))

(defun tab-bar-sep ()
	(propertize "    "
    'face 'my-tab-bar-face)
)

(defun tab-bar-update ()
  (setq tab-bar-format
        '(
          tab-bar-format-history
          (lambda () (if (eq 1 (length (tab-bar-tabs)))
                         (propertize " " 'face 'my-tab-bar-face) ;; Blank if 1 tab
                         (tab-bar-format-tabs))) ;; Else use tabs
		  (format "%s" (tab-bar-format-tabs))
          tab-bar-format-align-right
          ;tab-bar-separator
          ;(lambda () (propertize "Your Custom String" 'face 'my-tab-bar-face))
          tab-bar-sep
          (lambda () (propertize (concat "  " (format-time-string tab-bar-date-fmt) "  ")
                      'face 'my-tab-bar-face))
		      tab-bar-separator
          (lambda () (propertize (concat " " (format-time-string tab-bar-time-fmt))
                      'face 'my-tab-bar-face))
		  tab-bar-separator
          )))
(setq tab-bar-position t)

(message (format "%s" (tab-bar-format-tabs)))
(tab-bar-update)

(setq mode-line-format "Hi")
(tab-bar-mode 1)

;(global-tab-line-mode)

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/_0025_002dConstructs.html
;(setq mode-line-position (list "(Line: %l, Char: %C)"))

;(setq mode-line-misc-info '((:eval (concat "uno " "dos"))))
(defun tab-bar-refresh ()
  ;(tab-bar-mode -1)
  ;(tab-bar-mode 1))
  (force-mode-line-update t))

(run-with-timer 0 tab-bar-refresh-sec 'tab-bar-refresh)
