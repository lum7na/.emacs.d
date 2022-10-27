(defvar in-gui t)
(setq my-org-roam-path "d:/org-roam/")
(setq my-zotero-path "d:/zotero/")

(add-to-list 'load-path "~/.emacs.d/loads")
(add-to-list 'load-path "~/.emacs.d/nano-theme")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" default))
 '(package-selected-packages
   '(apropospriate-theme org youdao-dictionary yasnippet-snippets xenops which-key valign treemacs-projectile treemacs-magit treemacs-icons-dired quelpa-use-package prescient org-superstar org-roam-ui org-roam-bibtex org-ref org-protocol-capture-html org-modern org-download org-appear nano-theme nano-emacs major-mode-hydra laas ivy-yasnippet ivy-xref ivy-bibtex ivy-avy flycheck doom-themes doom-modeline diredfl dired-rsync dired-quick-sort dired-git-info counsel-tramp counsel-projectile company auto-yasnippet auto-package-update amx all-the-icons-ivy-rich all-the-icons-dired)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "#546E7A" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#546E7A" :height 1.3))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#546E7A" :height 1.2))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#546E7A" :height 1.15))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#546E7A" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#546E7A"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#546E7A"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#546E7A"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#546E7A")))))
