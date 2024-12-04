;; -*- lexical-binding: t -*-

(defun tab--add-metadata (key value)
  (let ((tabs (tab-bar-tabs)))
    (dotimes (i (length tabs))
      (let ((tab (nth i tabs)))
        (when (eq (car tab) 'current-tab)
          (let ((existing-pair (assoc key tab)))
            (if existing-pair
              (setcdr existing-pair value)
              (setq tab (append tab (list (cons key value))))
						)
            (setf (nth i tabs) tab)
            (message "Modified current tab: %s" tab)
					)
				)
			)
		)
	)
)

(defun tab--get-metadata (key &optional tab)
  (let ((tab (or tab (seq-find (lambda (tab) (eq (car tab) 'current-tab)) (tab-bar-tabs)))))
    (when tab
      (cdr (assoc key tab))
		)
	)
)
