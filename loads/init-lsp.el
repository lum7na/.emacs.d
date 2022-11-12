(require 'init-vars)

(when init-lsp-lock
  (progn
    (use-package lsp-mode
      :init
      ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
      (setq lsp-keymap-prefix "C-c l")
      :hook (
             (lsp-mode . lsp-enable-which-key-integration))
      :commands lsp
      :init ;;
      (setq lsp-auto-configure t 
            lsp-auto-guess-root t 
            lsp-idle-delay 0.500 
            lsp-session-file "~/.emacs/.cache/lsp-sessions") 
      )

    ;; optionally
    (use-package lsp-ui
      :commands lsp-ui-mode
      :bind
      (:map lsp-ui-mode-map
            ([remap xref-find-references] . lsp-ui-peek-find-references)
            ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
            ("C-c u" . lsp-ui-imenu))
      :hook (lsp-mode . lsp-ui-mode)
      :init
      (setq lsp-enable-symbol-highlighting t
            lsp-ui-doc-enable t
            lsp-lens-enable t))

    ;; if you are ivy user
    (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
    (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

    )
  )

(provide 'init-lsp)
