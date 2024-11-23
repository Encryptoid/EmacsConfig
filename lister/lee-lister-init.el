;; -*- lexical-binding: t -*-

(load-conf "lister/lee-lister-structs.el")
(load-conf "lister/lee-lister-input.el")
(load-conf "lister/lee-lister-fmt.el")
(load-conf "utils/lee-json.el")
 
(setq lister-dir "/home/l/.config/emacs-local/lister/")

(defun get-lister-keymap (test)
	(let ((map (make-sparse-keymap)))
		(define-key map (kbd "C-i")
		  (lambda () (interactive)
			  (message "Here")
			)
		)
		map
	)
)

(defun action-wrap (lister selection fmt-map)
	(interactive)
			(message "selecti: %s" selection)
	(let ((action (list-template-action lister)))
		(when-let ((item (cdr (assoc selection fmt-map))))
			(funcall action item)
		)
	)
)

(setq lister-curr-lister nil)
(setq lister-curr-list nil)
(setq lister-curr-sel nil)

(defun lister--file-name (lister)
	(message "lister: %s" lister)
	(concat lister-dir (list-template-name lister) ".json")
)

;(lee-json-read (lister--file-name lister-template-workspace))

(defun add-temp-hook (hook func)
  "Add FUNC to HOOK as a temporary hook.
FUNC will run once and remove itself from HOOK."
  (let ((wrapper-func nil)) ; Declare wrapper-func in outer scope
    (setq wrapper-func
          (lambda (&rest args)
            ;; Run the original function
            (apply func args)
            ;; Remove this wrapper function from the hook
            (remove-hook hook wrapper-func)))
    (add-hook hook wrapper-func)))

;(add-temp-hook 'minibuffer-exit-hook (lambda () (tab-new)))


(defun lister--setup-new-tab (is-new-tab prev-tab map)
	(when (eq t is-new-tab)
		(tab-new)
    (evil-define-key 'insert minibuffer-local-map (kbd "C-t")
			(lambda ()
				(interactive)
				(message "Closing tab %s " prev-tab)
				(tab-bar-close-tab prev-tab)
			)
		)
  )
)

(setq lister--v-minibuffer-exit-delay 0.1)
(defun lister--new-keymap ()
	(interactive)
	(let (map (make-sparse-keymap))
    (evil-define-key 'insert minibuffer-local-map (kbd "C-t")
			(lambda ()
				(interactive)
				;(message "Closing tab %s " prev-tab)
				;(tab-bar-close-tab prev-tab)
				(run-at-time lister--v-minibuffer-exit-delay nil (lambda ()
														 (tab-new)
														 (action-wrap lister-curr-lister lister-curr-sel lister-curr-fmt)
														 ))
				(exit-minibuffer)
			)
		)
	)
)

(defun lister-consult (lister)
	(interactive)
	(setq lister-curr-lister lister)
  (let* ((map (make-sparse-keymap))
         (path (lister--file-name lister))
				 (curr-tab (tab-bar--current-tab-index))
			 (is-new-tab (list-template-new-tab lister))
				)
		;(lister--setup-new-tab is-new-tab curr-tab map)
    ;(define-key map (kbd "C-j")
      ;(lambda ()
        ;(interactive)
				;;(message "sel: %s" (cdr (assoc lister-curr-sel lister-curr-fmt)))
				;(add-temp-hook 'minibuffer-exit-hook
											 ;(lambda ()
												 ;(run-at-time 2 nil (lambda ()(funcall (list-template-action lister) (cdr (assoc lister-curr-sel lister-curr-fmt)))))
											 ;)
											 ;)
				;(exit-minibuffer)
				;;(abort-recursive-edit)
												 ;;(funcall (list-template-action lister) (cdr (assoc lister-curr-sel lister-curr-fmt)))
			;)
		;)
		(let* (
					 (list (lee-json-read path))
					 (fmt-map (lister-fmt-map lister list)))
			(setq lister-curr-list list)
			(setq lister-curr-fmt fmt-map)
      (consult--read
         (mapcar #'car fmt-map)
         :prompt (format "Select %s: " (list-template-name lister))
         :sort nil
         :require-match t
         :category 'custom
         ;:history 'my-consult-custom-list-history
         :default nil
			   :keymap (lister--new-keymap)
				 :preview-key 'any
         :state (lambda (act selection)
										;(message "setting sel: %s act: %s" selection act)
								  (when (and (eq act 'preview) (not (eq selection nil)))
									  (setq lister-curr-sel selection)
								  )
                  (when (eq act 'return)
									  (setq lister-curr-sel selection)
                    (action-wrap lister lister-curr-sel fmt-map)
								  )
								  ;(setq lister-selection nil)
								  ;(setq lister-current nil)
							  )
	    )
		)
	)
)
