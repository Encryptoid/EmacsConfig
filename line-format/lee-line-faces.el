(defface face-dark-lime
  '((t))
  "Custom face for tab-bar formatting.")
(set-face-attribute 'face-dark-lime nil
                    :weight 'bold
										;:height 50
                    :foreground "#111"
										;:box nil
										;:width 'ultra-expanded
										)

(defface face-gray
  '((t))
  "Custom face for tab-bar formatting.")
(set-face-attribute 'face-gray nil
                    :weight 'bold
										;:height 50
                    :foreground "#999"
										;:box nil
										;:width 'ultra-expanded
										)

(defface face-dark-white
  '((t))
  "Custom face for tab-bar formatting.")
(set-face-attribute 'face-dark-white nil
                    :weight 'bold
                    :foreground "#EEEEEE")

(defface face-tab-sep
  '((t :inherit face-dark-lime))
  "A derived face inheriting from my-base-face.")

(defface face-tab-bg
  '((t :inherit face-dark-lime))
  "A derived face inheriting from my-base-face.")

(set-face-attribute 'face-tab-sep nil
                    :height 120
										:width 'ultra-expanded
										)


(defface face-tab-val
  '((t :inherit face-dark-white))
  "A derived face inheriting from my-base-face.")
(set-face-attribute 'face-tab-val nil
										:background "#000"
										)

(defface face-tab-icon
  '((t :inherit face-gray))
  "A derived face inheriting from my-base-face.")
(set-face-attribute 'face-tab-icon nil
										:background "#000"
										)

(defvar tab-line-font-height 1.1)

(defface tab-line-bg-1 '(( t :background "#ADADAD" :foreground "#111")) "Doc String")
(defface tab-line-bg-2 '(( t :background "#8F8F8F" :foreground "#111")) "Doc String")
(defface tab-line-bg-3 '(( t :background "#707070" :foreground "#EEE")) "Doc String")
(defface tab-line-bg-4 '(( t :background "#525252" :foreground "#EEE")) "Doc String")
(defface tab-line-bg-5 '(( t :background "#333333" :foreground "#EEE")) "Doc String")
(defface tab-line-bg-6 '(( t :background "#333333" :foreground "#EEE")) "Doc String")
(defface tab-line-bg-7 '(( t :background "#333333" :foreground "#EEE")) "Doc String")

(defvar tab-line-bgs '(tab-line-bg-1 tab-line-bg-6))

(defun update-tab-line-font-heights (faces)
  "Update the font height for all faces in `tab-line-faces`."
  (dolist (face faces)
    (when (facep face) ;; Ensure the face exists
      (set-face-attribute face nil :height tab-line-font-height))))

(update-tab-line-font-heights tab-line-bgs)
