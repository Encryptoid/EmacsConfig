;(set-frame-font "CaskaydiaMono Nerd Font-13")
(set-frame-font "Iosevka Nerd Font-13.5")
 
;(set-face-attribute 'default nil
                    ;:font "Jetbrains Mono Nerd Font-12")

(defun my-set-default-font (frame)
  "Set the default font for the FRAME."
  (set-face-attribute 'default frame
                      ;:font "Jetbrains Mono Nerd Font-12"))
                      :font "Iosevka Nerd Font-13.5"))

(add-hook 'after-make-frame-functions 'my-set-default-font)
;(set-frame-font "Jetbrains Mono Nerd Font-13")
;(set-frame-font "FiraCode Nerd Font-13")
;(set-frame-font "Hack Nerd Font Mono-13")
(setq-default line-spacing 0.05)

;(load-theme 'gruber-darker t)
;(load-pack "modus-themes" "modus-vivendi")
;(load-pack "modus-themes" "modus-vivendi")

;(load-theme-pack "modus-themes")

(load-pack "modus-themes" "*")
(require 'modus-themes)
(require 'modus-vivendi-deuteranopia-theme)
(load-theme 'modus-vivendi-deuteranopia)
;(load-theme 'modus-vivendi t)
;(load-theme 'modus-vivendi-tinted t)
;(load-theme 'modus-vivendi-tinted t)
; deuteranopia

;(load-pack "modus-themes" "modus-vivendi-tritanopia-theme")

; Nordy
;(load-pack "zeno-theme")
;(load-theme 'zeno)

;(load-pack "atom-one-dark-theme")
;(load-pack "gruber-darker-theme")
;(load-theme 'gruber-darker)
;(load-pack "ample-theme")
;(load-theme 'ample)

