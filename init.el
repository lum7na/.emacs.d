(defvar in-gui t)
(setq my-org-roam-path "d:/org-roam/")
(setq my-zotero-path "d:/zotero/")

(add-to-list 'load-path "~/.emacs.d/loads")

(require 'init-basic)
(require 'init-hydra)
(require 'init-theme)
(require 'init-dired)
(require 'init-ivy)
(require 'init-misc)
(require 'init-treemacs)
(require 'init-tabs)
(require 'init-org)
(require 'init-fonts)

(use-package-report)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org youdao-dictionary valign quelpa-use-package org-superstar org-protocol-capture-html org-download major-mode-hydra ivy-yasnippet ivy-xref dired-quick-sort dired-git-info counsel-tramp counsel-projectile cdlatex auto-yasnippet amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
