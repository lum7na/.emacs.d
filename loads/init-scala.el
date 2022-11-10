(require 'init-vars)

(use-package scala-mode)

(when (init-scala-lsp)
  (progn
    (require 'init-lsp)
    (setq init-lsp-lock nil)
    
    (add-hook 'scala-mode-hook 'lsp-mode)
    (use-package lsp-metals
      :ensure t
      :custom
      ;; Metals claims to support range formatting by default but it supports range
      ;; formatting of multiline strings only. You might want to disable it so that
      ;; emacs can use indentation provided by scala-mode.
      (lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
      )
    )



  (provide 'init-scala)
