(load-pack "s")
(load-pack "f")

(load-pack "dash")

(load-pack "ht")
(load-pack "lv")
(load-pack "markdown-mode")
(load-pack "spinner")

(load-pack "lsp-mode")
;(add-hook 'python-mode-hook #'lsp)

(setq lsp-pyright-python-executable-cmd "/home/l/temp/python-venv/bin/python")

(load-pack "lsp-pyright")
(require 'lsp-pyright)
 jk(lsp)

(setq lsp-pyright-langserver-command "pyright")



  ;(setq lsp-pyright-venv-path "/home/l/temp/python-venv"  ; Replace with your venvs directory
        ;lsp-pyright-venv-directory "python"  ; Replace with the venv name
        ;lsp-pyright-python-executable-cmd "python") ; Ensure Python in the venv is used

(setq exec-path (append exec-path '("/home/l/apps/node/bin/")))
