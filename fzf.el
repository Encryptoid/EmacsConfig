;; -*- lexical-binding: t -*-
;; https://github.com/bling/fzf.el
(load-pack "fzf")
(use-package fzf
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll --layout reverse --height 100%"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        fzf/grep-command "rg --no-heading -nH"
        ;; fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 100
 )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f d") (lambda () (interactive) (fzf-find-file cwd)))

;(evil-define-key 'normal 'evil-mode
  ;(kbd "g l") 'fzf-recentf)

;(evil-define-key 'normal 'evil-mode
  ;(kbd "g l")
  ;'("Ripgrep cwd" .
     ;(lambda () (interactive)
	   ;(counsel-fzf "" cwd "")
     ;)
  ;)
;)



(recentf-mode t)
;(fzf-find-file cwd)

(defun fzf-dir (dir)
  (fzf-with-entries
	(seq-remove (lambda (file) (member file '("." "..")))
				(directory-files dir))
   'find-file))

;; https://github.com/abo-abo/swiper
;(load-pack "ivy")
;(load-pack "ivy" "counsel")
;(ivy-mode)

;; https://github.com/tumashu/posframe
;; https://github.com/tumashu/ivy-posframe
;(load-pack "posframe")
;(load-pack "ivy-posframe")
;(ivy-posframe-mode t)
;(setq ivy-posframe-height-alist '((swiper . 20)
                                  ;(t      . 40)))

;; https://github.com/minad/consult
(load-pack "compat")
(load-pack "consult")
;(counsel-mode)

(defun lee-recentf ()
  (interactive)
  (consult-recent-file)
  )

(evil-define-key '(normal emacs) 'evil-mode
  (kbd "g k") 'consult-recent-file
)

(defun test-rg (&optional input dir)
  (interactive)
  (let ((process-environment
		 (cons (concat "FZF_DEFAULT_COMMAND=rg -5n --files --no-follow --hidden")
			   process-environment)))
	(counsel-fzf input dir))
  )

;(test-rg "evil" "~/.config/emacs/")
;(counsel-rg "" "~/.config/emacs/" "--hidden --no-follow")

(evil-define-key 'insert minibuffer-local-map (kbd "C-v") 'yank)

(load-pack "orderless")
(require 'orderless)

;; ESC to exit minibuffer
(evil-define-key 'normal ivy-minibuffer-map [escape]
  'minibuffer-keyboard-quit)
 
(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f j")
  '("Ripgrep cwd" .
     ;(lambda () (interactive)
	   ;(counsel-rg "" cwd "")
	   consult-ripgrep
     ;)
  )
)

(evil-define-key 'normal 'evil-mode
  (kbd "<SPC> f f")
  '("Ripgrep cwd" .
	   consult-ripgrep
  )
)

;(fzf-grep-in-dir "~/.config/emacs" t "your-file-pattern")

(defun lee-fzf-list (input-alist fmt-fn)
  ;; Check the structure of `input-alist` to troubleshoot if it's nil
  (message "input-alist: %S" input-alist)  ;; This line prints to the *Messages* buffer for debugging
  (let ((formatted-list (mapcar (lambda (entry) (funcall fmt-fn entry)) input-alist)))
    (fzf-with-entries
     formatted-list
     (lambda (selected)
       ;; Find the original entry by matching `selected` with `formatted-list`
       (cdr (assoc selected
                   (mapcar (lambda (entry)
                             (cons (funcall fmt-fn entry) entry))
                           input-alist))))
     )))

(setq my-workspaces-alist
      '((:ws1 . ((:Name . "ws-name-1")
                 (:Path . "ws-path-1")))
        (:ws2 . ((:Name . "ws-name-2")
                 (:Path . "ws-path-2")))))

(defvar workspace-template
  '("Name" "Shortcut" "Path"))

;(defvar lee-test (lee-json-read "~/.config/emacs-local/workspace.json"))

(defun lee-list-first (list field value)
  (if (null list)
	  nil
	(let ((item (car list)))
	  (if (equal value (cdr (assoc field item)))
		  item
		(lee-list-first (cdr list) field value))
	)
  )
)

;(lee-list-first lee-test "Name" "Notes")


(defun get-field (fields &optional res)
  (interactive)
  (if (null fields)
	  (message "end")
	(let* (
	  (field-name (car fields))
	  (user-input (read-string (format "%s: " field-name)))
	  )
	  (get-field (cdr fields)
				 (append res (list (cons field-name user-input)))
	  )
	)
  )
)

;(get-field workspace-template)

(defun fmt-fun (entry)
  (format "%s: %s"
          (car entry)
          (cdr (assoc :Name (cdr entry)))))

;; Call the function
;(lee-fzf-list my-workspaces-alist 'fmt-fun)

(defun fzf-fullscreen-with-layout-preserved ()
  "Run FZF in fullscreen without closing other windows, restoring layout afterward."
  (interactive)
  (let ((current-window (selected-window))
        (fzf/window-height 100))  ;; Set FZF height to fullscreen
    (window-configuration-to-register :fzf-fullscreen)  ;; Save current layout
    (view-echo-area-messages)
    (add-hook 'kill-buffer-hook
              (lambda ()
                (jump-to-register :fzf-fullscreen)
                (select-window current-window))
              nil 'local))
)



(defun my-centered-term-frame ()
  "Show an interactive terminal in a floating frame, centered on screen."
  (interactive)
  (let* ((frame (make-frame '((name . "my-terminal-frame")
                              (width . 90)   ;; Adjust width as needed
                              (height . 30)  ;; Adjust height as needed
                              (minibuffer . nil)
                              (unsplittable . t)
                              (undecorated . t)  ;; Removes title bar
                              (skip-taskbar . t)
                              (visibility . nil) ;; Hide initially to avoid flash
                              (internal-border-width . 10))))
         (term-buffer (make-term "my-terminal" "/bin/bash")))  ;; Replace with preferred shell
    ;; Configure terminal buffer
    (with-current-buffer term-buffer
      (term-mode)
      (term-char-mode))
    ;; Display buffer in the new frame
    (select-frame-set-input-focus frame)
    (set-window-buffer (frame-root-window frame) term-buffer)
    (make-frame-visible frame)
    ;; Center frame on screen
    (set-frame-position frame
                        (/ (- (display-pixel-width) (* 0.9 (frame-pixel-width frame))) 2)
                        (/ (- (display-pixel-height) (* 0.9 (frame-pixel-height frame))) 2))))

(defun my-hide-centered-term-frame ()
  "Close the floating frame containing the terminal."
  (interactive)
  (when-let ((frame (get-frame "my-terminal-frame")))
    (delete-frame frame)))


(defun my-fzf-custom-list (list format-fn)
  "Display LIST in fzf with custom FORMAT-FN and return the original value on selection."
  (interactive)
  (let* ((formatted-list (mapcar format-fn list))
         (selected (fzf-start formatted-list :fullscreen t)))
    (when selected
      (cdr (assoc selected (cl-pairlis formatted-list list)))))
)


;(with-temp-buffer-window "*popup*" '((display-buffer-in-side-window)
                                     ;(window-height . fit-window-to-buffer)
                                     ;(side . top)
                                     ;(window-parameters . ((no-other-window . t))))
  ;(with-current-buffer "*popup*"
    ;(insert "Edit this text here...\n"))
  ;(recursive-edit)
;)

(defun lee-pop-test ()
  "Create and display a term buffer running fzf."
  (interactive)
  (let ((buffer (get-buffer-create "*fzf-term*")))
    (make-term "fzf-term" "sh" nil "-c" "fzf")
    (set-buffer buffer)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer buffer)
    (display-buffer buffer '((display-buffer-same-window)))
  )
)


;(setq display-buffer-alist
      ;'(("\\*consult-preview\\*"
         ;(display-buffer-reuse-window display-buffer-reuse-window)
         ;(side . right)
         ;(slot . 1) ; Use the existing second buffer
         ;(window-width . 0.5)
         ;(window-parameters . ((no-delete-other-windows . t))))))

(setq display-buffer-alist
      '(("Preview.*" ;; Match all buffer names
         (display-buffer-reuse-window display-buffer-same-window)
         (inhibit-same-window . nil) ; Allow displaying in the same window
         (reusable-frames . visible))))

(defun consult--buffer-preview ()
  "Simplified buffer preview function."
  (let (preview-win)
    (lambda (action cand)
      (pcase action
        ('exit
         (when (window-live-p preview-win)
           (quit-window nil preview-win)
           (setq preview-win nil)))
        ('preview
         (let ((buf (get-buffer cand)))
           (when (and buf (buffer-live-p buf))
             (setq preview-win
                   (or preview-win
                       (window-in-direction 'right)
                       (window-in-direction 'left)
                       (split-window (selected-window) nil 'right)))
             (with-selected-window preview-win
               (switch-to-buffer buf 'norecord)))))))))


(setq consult-preview-key 'any)

;(setq consult-preview-function-recent-file #'counsel--buffer-preview-find-file
;		consult-preview-function-ripgrep #'consult--buffer-preview-ripgrep)

; Breaks
;(consult-customize
 ;consult-recent-file :preview-key consult-preview-function-find-file
 ;consult-ripgrep :preview-key consult-preview-function-ripgrep)

(defun reuse-preview-buffer (buf-name)
  "Reuse an existing buffer if its name starts with 'Preview:'."
  (when (and (string-prefix-p "Preview:" buf-name)
						 (message "here!")
             (get-buffer buf-name))
    (switch-to-buffer buf-name 'norecord)))

(defun auto-reuse-preview-buffer (obj)
  "Hook function to reuse 'Preview:' buffers if they exist.
Works for both windows and frames."
  (let* ((buffer (cond
                  ((windowp obj) (window-buffer obj))
                  ((framep obj) (window-buffer (frame-selected-window obj)))))
         (buf-name (and buffer (buffer-name buffer))))
    (when (and buf-name
               (string-prefix-p "Preview:" buf-name)
               (get-buffer buf-name))
      (switch-to-buffer buf-name 'norecord))))

;; Add the hook to `window-buffer-change-functions`
(add-hook 'window-buffer-change-functions #'auto-reuse-preview-buffer)

