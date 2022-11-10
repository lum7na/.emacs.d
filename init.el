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


