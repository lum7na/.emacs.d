(require 'init-vars)

(when (init-lsp-lock)
  (progn
    (use-package lsp-mode
      :init
      ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
      (setq lsp-keymap-prefix "C-c l")
      :hook (
             (lsp-mode . lsp-enable-which-key-integration))
      :commands lsp)

    ;; optionally
    (use-package lsp-ui :commands lsp-ui-mode)

    ;; if you are ivy user
    (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
    (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

  )

(provide 'init-lsp)
