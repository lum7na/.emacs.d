(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)

(display-time-mode 1)
(setq display-time-day-and-date t)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq-default cursor-type 'bar)

(global-visual-line-mode 1) 

(use-package all-the-icons
  :if in-gui
  :hook (after-init . all-the-icons-ivy-rich-mode)
  )

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'modus-operandi t)
      

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(provide 'init-theme)
