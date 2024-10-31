;; https://github.com/tkf/emacs-request
(load-pack "request")

;; https://github.com/politza/tablist
(load-pack "tablist")

;; https://github.com/magnars/dash.el
(load-pack "dash")

;; https://github.com/magit/magit-popup
(load-pack "magit-popup")

;; https://github.com/emacsmirror/tblui
(load-pack "tblui")

;; https://github.com/emacs-openai/openai/
(load-pack "openai")

;(setq openai-key "")

;; https://github.com/emacs-straight/lv/blob/master/lv.el
(load-pack "lv")

;; https://github.com/Wilfred/ht.el
(load-pack "ht")

;; https://github.com/jrblevin/markdown-mode
(load-pack "markdown-mode")

;; https://github.com/Malabarba/spinner.el
(load-pack "spinner")

;; https://github.com/emacs-openai/chatgpt
(load-pack "chatgpt")
(require 'openai-completion)

(message (format "%s" chatgpt-model))

(use-package chatgpt
  :defer t
  :bind ("C-c q" . chatgpt-query))
