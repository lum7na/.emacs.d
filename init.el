(add-to-list 'load-path "~/.emacs.d/loads")

(require 'init-basic)
(require 'init-theme)
(require 'init-dired)
(require 'init-ivy)
(require 'init-misc)
(require 'init-treemacs)
(require 'init-tabs)

(when (display-graphic-p)
  (require 'init-org)
  (require 'init-fonts)
  )

(require 'init-scala)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-metals lsp-treemacs lsp-ivy lsp-ui lsp-mode yasnippet-snippets which-key treemacs-projectile treemacs-magit treemacs-icons-dired scala-mode quelpa-use-package prescient ivy-yasnippet ivy-xref ivy-avy flycheck fd-dired doom-themes doom-modeline diredfl dired-rsync dired-quick-sort dired-git-info counsel-tramp counsel-projectile company auto-yasnippet auto-package-update amx all-the-icons-ivy-rich all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
