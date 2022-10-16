;;(use-package centaur-tabs
;;  :demand
;;  :config
;;  (centaur-tabs-mode t)
;;  (centaur-tabs-headline-match)
;;  (setq centaur-tabs-style "rounded")
;;  (setq centaur-tabs-set-icons t)
;;  :bind
;;  ("C-;" . centaur-tabs-backward)
;;  ("C-'" . centaur-tabs-forward))

(use-package ace-window
  :bind
  ("M-o" . ace-window))

(use-package which-key
  :config (which-key-mode 1))

(provide 'init-tabs)
