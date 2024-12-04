;; -*- lexical-binding: t -*-

(defun lee-json-write (data filepath)
	(interactive)
  (let ((json-object-type 'alist) 
        (json-array-type 'vector)) 
    (with-temp-buffer
			(message "Writing JSON File: %s, Contents: %s" filepath data)
      (insert (json-encode data))
      (json-pretty-print-buffer)
      (write-region (point-min) (point-max) filepath))))

(defun json-to-list (json-data)
  "Convert JSON data from vector of alists to a list of alists."
  (mapcar (lambda (entry)
            (append entry nil)) ;; Ensure each entry is a proper alist
          (append json-data nil))) ;; Convert vector to list

(defun lee-json-read (file-path)
  "Read and parse JSON from FILE-PATH, returning nil if the file is empty."
  (if (zerop (nth 7 (file-attributes file-path)))  ; Check if file size is zero
			((message "Json file was nil: %s" file-path)
      nil)
		(json-to-list (json-read-file file-path))
  )
)

;(lee-json-read "/home/l/.config/emacs-local/lister/Workspace.json")
