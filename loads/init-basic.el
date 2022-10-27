;;; package --- Summary
;;; Commentary:
;;; Code:

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





(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-locale-environment "UTF-8")
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(add-to-list 'process-coding-system-alist '("rg" utf-8 . gbk))

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(set-next-selection-coding-system 'utf-16-le)
(set-selection-coding-system 'utf-16-le)
(set-clipboard-coding-system 'utf-16-le)
;;(set-clipboard-coding-system 'utf-16le-dos)


(setq native-comp-async-report-warnings-errors nil)

(setq org-roam-v2-ack t)
(pixel-scroll-precision-mode 1)

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backup")))

(use-package major-mode-hydra
  :ensure t
  :demand t
  :bind
  ("M-<SPC>" . major-mode-hydra)
)


(provide 'init-basic)
;;; init_basic.el ends here


