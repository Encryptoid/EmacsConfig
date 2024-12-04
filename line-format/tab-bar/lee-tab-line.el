;; -*- lexical-binding: t -*-
(load-conf "line-format/lee-line-faces.el")
(load-conf "line-format/tab-bar/lee-date-bar.el")

(cl-defstruct tab-bar-el
	func
	before
	after
)

(defvar tab-bar-els
	(list)
)

(defun tab-bar--eval-face (el counter)
	(interactive)
	(let ((val (funcall (tab-bar-el-func el)))
				(face (intern (format "tab-line-bg-%d" (mod counter 6))))
				(before (tab-bar-el-before el))
				(after (tab-bar-el-after el))
	  )
		(let ((bval (cond
								  ((stringp after) after)
								  ((symbolp after) (funcall after val))
								  (t nil)
					      )
			))
      (propertize
		    (concat " "
		      (or (tab-bar-el-before el) "{")
		      " "
		      val
		      " "
		      (or bval (or before "}"))
		      " ")
		    'face face
		  )
		)
	)
)

(defun tab-bar--process (elements)
	(interactive)
	(let ((res '())
				(counter 1))
	  (dolist (el elements)
			(let ((cc counter))
		  ;(push (lambda () (tab-bar--eval-face el counter)) res)
		   (push (lambda () (tab-bar--eval-face el cc)) res)
			 (setq counter (1+ counter))
			)
	  )
	res
	)
)

(defun tab-bar-update ()
	(interactive)
  (setq-default tab-bar-format
	  (append
      (list 'tab-bar-format-tabs 'tab-bar-format-align-right)
      (tab-bar--process tab-bar-els)
	  )
  )
)

