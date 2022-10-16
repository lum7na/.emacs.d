(pretty-hydra-define global
  (:color amaranth :quit-key "q" :title "Global")
  ("Basic" 
  (("bn" linum-mode "line number" :toggle t)
   ("bw" whitespace-mode "whitespace" :toggle t)
   ("bW" whitespace-cleanup-mode "whitespace cleanup" :toggle t)
   ("br" rainbow-mode "rainbow" :toggle t)
   ("bL" page-break-lines-mode "page break lines" :toggle t))
  "Highlight"
  (("hs" symbol-overlay-mode "symbol" :toggle t)
   ("hl" hl-line-mode "line" :toggle t)
   ("hx" highlight-sexp-mode "sexp" :toggle t)
   ("ht" hl-todo-mode "todo" :toggle t))
  "Coding"
  (("cp" smartparens-mode "smartparens" :toggle t)
   ("cP" smartparens-strict-mode "smartparens strict" :toggle t)
   ("cS" show-smartparens-mode "show smartparens" :toggle t)
   ("cf" flycheck-mode "flycheck" :toggle t))
  "Org"
  (("of" org-roam-node-find "org-roam find" :exit t)
   ("oc" org-roam-capture "org-roam capture" :exit t)
   ("hb" ivy-bibtex "bibtex" :exit t)
   ("gt" org-gtd/body "org gtd" :exit t))
  "Fonts"
  (("-" text-scale-decrease "decrease text scale")
   ("+" text-scale-increase "increase text scale"))
  "Emacs"
  (("D" toggle-debug-on-error "debug on error" :toggle (default-value 'debug-on-error))
   ("X" toggle-debug-on-quit "debug on quit" :toggle (default-value 'debug-on-quit)))
  "WorkSpace"
  (("wa" my/projectile-add-known-project "add project(must in root directory)" :exit t)
   ("wd" projectile-remove-known-project "remove project" :exit t)
   ("ws" counsel-projectile-switch-project "switch to project" :exit t))
  ))


(global-set-key (kbd "M-<f12>") 'global/body)
(provide 'init-hydra)
