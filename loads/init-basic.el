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

;; show statistics after init
(setq use-package-compute-statistics t)

(setq use-package-always-ensure t)

(use-package auto-package-update
  :ensure t
  :commands auto-package-update-now auto-package-update-now-async
  :custom
  (auto-package-update-delete-old-versions t))

(use-package quelpa-use-package)




 (when 'windows-nt
   (prefer-coding-system 'utf-8)
   (set-language-environment 'utf-8)
   (set-locale-environment "UTF-8")
   (set-keyboard-coding-system 'utf-8)
   (set-clipboard-coding-system 'utf-16le-dos)
   (set-terminal-coding-system 'utf-8)
   (set-buffer-file-coding-system 'utf-8)
   (set-default-coding-systems 'utf-8)
   (set-selection-coding-system 'utf-8)
   (modify-coding-system-alist 'process "*" 'utf-8)
   (set-file-name-coding-system 'utf-8)
   (setq native-comp-async-report-warnings-errors nil)
;; ;;  (setenv "PATH" "C:\\msys64\\usr\\local\\bin;C:\\msys64\\usr\\bin;C:\\msys64\\usr\\bin;C:\\msys64\\opt\\bin;C:\\Windows\\System32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\msys64\\usr\\bin\\site_perl;C:\\msys64\\usr\\bin\\vendor_perl;C:\\msys64\\usr\\bin\\core_perl;C:\\texlive\\2021\\bin\\win32;C:\\Users\\Mirac\\AppData\\Local\\Pandoc;C:\\Program Files\\ImageMagick-7.1.0-Q16-HDRI;C:\\Program Files\\Common Files\\Oracle\\Java\\javapath;C:\\Program Files\\Wolfram Research\\WolframScript;C:\\Users\\Mirac\\AppData\\Local\\Programs\\Python\\Python39;C:\\Users\\Mirac\\AppData\\Local\\Programs\\Python\\Python39\\Scripts;C:\\Program Files\\Google\\Chrome\\Application;")
;; ;;  (setq exec-path (split-string (getenv "PATH") path-separator))
   )



;;(global-display-line-numbers-mode 1)
;;(global-hl-line-mode 1)

(setq org-roam-v2-ack t)

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


