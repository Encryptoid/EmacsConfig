(setq-default evil-want-keybinding nil)

;; https://github.com/emacs-evil/evil
(load-pack "evil")
(evil-mode 1)

;; https://github.com/noctuid/annalist.el
(load-pack "annalist")

;; https://github.com/emacs-evil/evil-collection
(load-pack "evil-collection")
(evil-collection-init 'help)

;; https://github.com/emacs-evil/evil-collection/blob/master/modes/minibuffer/evil-collection-minibuffer.el
(load-pack "evil-collection-minibuffer")
(evil-collection-minibuffer-setup)

(load-pack "evil-goggles")
(evil-goggles-mode)
(setq-default evil-goggles-pulse nil) 
(setq-default evil-goggles-duration 0.100)

;; TODO Set colours
(custom-set-faces
 '(evil-goggles-delete-face ((t (:inherit diff-refine-removed))))
 '(evil-goggles-change-face ((t (:inherit diff-refine-changed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-yank-face ((t (:inherit diff-refine-added))))
)


(load-file "~/.config/emacs/evil/navigation.el")
(load-file "~/.config/emacs/evil/text-edit.el")
(load-file "~/.config/emacs/evil/emacs.el")
