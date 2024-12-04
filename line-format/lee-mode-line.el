(defun lee-fmt-path (path)
  (replace-regexp-in-string "^/home/l/" "~/" path)
)

(defun get-line-length ()
  (save-excursion
    (end-of-line)
    (current-column)
	)
)

(defun get-line-count ()
  "Return the total number of lines in the current buffer."
  (count-lines (point-min) (point-max))
)

(defun lee-mode-line ()
	(interactive)
	(let ((line-num (line-number-at-pos))
				(line-count (get-line-count))
				(col-num (current-column))
				(col-count (get-line-length))
				)
	  (concat " "
            " [ " (lee-fmt-path (buffer-file-name)) " ] "
					  " - "
					  (concat " [ Lines | "
							(format "%.0f" (* 100 (/ (float line-num) line-count))) "%%"
							" | " (str line-num)
						  " / "(str line-count)
							" ] "
						)
					  " - "
					  (concat " [ Chars | "
							(format "%.0f" (* 100 (if (eq col-count 0) 0 (/ (float col-num) col-count)))) "%%"
							" | "
						  (str col-num) " / "
						  (str col-count)
							" ] "
							;" [ Test | %o ] "
						)
						;" - "
						;" [ Size | %I ]"
		)
	)
)


(setq-default mode-line-format '(:eval (lee-mode-line)))

(setq mode-line-refresh-time 0.2)

(run-with-timer 0 mode-line-refresh-time #'force-mode-line-update)
