;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'init-vars)
(require 'package)

(setq package-check-signature nil)

;; set mirror
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; enable native compile
(setq package-native-compile t) 

;; install use-package if it is not installed
(when (not (package-installed-p 'use-package))
  (package-initialize)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(setq use-package-always-ensure t)

(use-package auto-package-update
  :ensure t
  :commands auto-package-update-now auto-package-update-now-async
  :custom
  (auto-package-update-delete-old-versions t))

(use-package quelpa-use-package)

(setq native-comp-async-report-warnings-errors nil)

(setq org-roam-v2-ack t)
(require 'init-vars)
(when (display-graphic-p)
  (pixel-scroll-precision-mode 1)
  )

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backup")))

(setq exec-path (append exec-path '("/opt/local/bin")))

(when (not (display-graphic-p))
  (xterm-mouse-mode 1)
  (mouse-wheel-mode 1)
  )


(provide 'init-basic)
;;; init_basic.el ends here


