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


;(defface face-dark-lime
  ;'((t))
  ;"Custom face for tab-bar formatting.")
;(set-face-attribute 'face-dark-lime nil
                    ;:weight 'bold
										;:height 50
                    ;:foreground "#56992d"
										;;:box nil
										;;:width 'ultra-expanded
										;)
			
(setq-default tab-bar-auto-width-min '(50 4))
(tab-bar-auto-width nil)

(message (format "%s" (length (tab-bar-tabs))))

;(defun tab-bar-sep ()
	;(propertize "    "
    ;'face 'face-dark-lime)
;)

;(defun tab-bar-update ()
  ;(setq tab-bar-format
        ;'(
          ;tab-bar-format-history
          ;(lambda () (if (eq 1 (length (tab-bar-tabs)))
                         ;(propertize " " 'face 'face-dark-lime) ;; Blank if 1 tab
                         ;(tab-bar-format-tabs))) ;; Else use tabs
		  ;(format "%s" (tab-bar-format-tabs))
          ;tab-bar-format-align-right
          ;;tab-bar-separator
          ;;(lambda () (propertize "Your Custom String" 'face 'my-tab-bar-face))
          ;tab-bar-sep
          ;;tab-bar-separator
          ;(lambda () (propertize (concat "  " (format-time-string tab-bar-date-fmt) "  ")
                      ;'face 'face-dark-white))
          ;tab-bar-sep
          ;(lambda () (propertize (concat " " (format-time-string tab-bar-time-fmt))
                      ;'face 'face-dark-white))
          ;tab-bar-sep
          ;)))

(setq tab-bar-position t)

(message (format "%s" (tab-bar-format-tabs)))

;(setq mode-line-format "Hi")
(tab-bar-mode t)

;(global-tab-line-mode)

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/_0025_002dConstructs.html
;(setq mode-line-position (list "(Line: %l, Char: %C)"))

;(setq mode-line-misc-info '((:eval (concat "uno " "dos"))))
(defun tab-bar-refresh ()
  ;(tab-bar-mode -1)
  ;(tab-bar-mode 1))
  (force-mode-line-update t))

(run-with-timer 0 tab-bar-refresh-sec 'tab-bar-refresh)


