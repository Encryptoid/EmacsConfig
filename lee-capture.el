(setq lorg-dir-notes "~/notes/org/")

(defun lorg-fmt-file-path (title)
  (interactive)
  (concat lorg-dir-notes
		  (replace-regexp-in-string " " "_" title)
		  ".org"
  )
)

(defun lorg-capture-template (title)
  (interactive)
  (format
"#+TITLE: %s
#+TAGS:"
    title
  )
)

(defun lorg-capture ()
  "Prompt for a title, create a new note file in `org-dir` with that title."
  (interactive)
  (let* ((title (read-string "Title: "))
         (file-path (expand-file-name (lorg-fmt-file-path title))))
	;(message "%s" (lorg-capture-template title))
    (find-file file-path)
	(insert (lorg-capture-template title))
	))

(defun fzf-dir (dir)
  (fzf-with-entries
	(seq-remove (lambda (file) (member file '("." "..")))
				(directory-files dir))
   'find-file))

(defun lee-print (msg)
  (interactive)
  (message "%s" msg)
)

(fzf-with-entries '("Test?") 'lee-print)
