;; -*- lexical-binding: t -*-

;(setq tab-bar-time-fmt-sec "%H:%M - %S secs -")
(setq tab-bar-time-fmt-sec "%H:%M:%S")
(setq tab-bar-time-fmt-min "%H:%M")
(setq tab-bar-date-fmt "%A - %b %d")
(setq tab-bar-time-fmt tab-bar-time-fmt-min)

(setq tab-bar-refresh-sec 5)
(setq show-seconds nil)

(defun seconds-toggle ()
  (interactive)
  (if show-seconds
    (progn (message "Hiding seconds")
      (setq show-seconds nil)
   	  (setq tab-bar-refresh-sec 5)
	  )
    (progn (message "Showing seconds")
       (setq show-seconds t)
       (setq tab-bar-time-fmt tab-bar-time-fmt-sec)
	   (setq tab-bar-refresh-sec 0.5)
	  )
  )
)

(defun date-bar-sun (time-str)
	(cond
	  ((string< time-str "07") icon-bed)
	  ((string< time-str "09") "🥣")
	  ((string< time-str "12") icon-sun)
	  ((string< time-str "13") "🥪")
	  ((string< time-str "16") icon-sun)
	  ((string< time-str "18") "🏡")
	  ((string< time-str "20") "🌆")
	  (t icon-bed)
  )
)
