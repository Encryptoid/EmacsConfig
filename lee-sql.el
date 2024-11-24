;; https://github.com/magit/emacsql

(load-pack "emacsql")

(require 'emacsql-sqlite)

(setq db (emacsql-sqlite "~/database/testql.db"))


(emacsql db [:create-table :if-not-exists projects
             ([id integer :primary-key]
              [name text]
              [value text])])

