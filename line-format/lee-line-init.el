;; Tab Bar
(load-conf "line-format/tab-bar/lee-tab-funcs.el")
(load-conf "line-format/tab-bar/lee-tab-line.el")

(setq tab-bar-els nil)
(push (make-tab-bar-el :func (lambda () (format-time-string tab-bar-time-fmt)) :before " " :after 'date-bar-sun) tab-bar-els)
(push (make-tab-bar-el :func (lambda () (format-time-string tab-bar-date-fmt)) :before " " :after "") tab-bar-els)

(tab-bar-update)
(tab-bar-mode t)

;; Tab Format
(load-conf "line-format/tab-bar/lee-tab-fmt.el")

;; Mode Line
(setq-default header-line-format nil)



