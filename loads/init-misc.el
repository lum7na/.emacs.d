(use-package yasnippet
  :config
  ;; 全局启用这个 minor mode
  (yas-global-mode 1))

;; 再装一个通用模板库，省得没 template 用
(use-package yasnippet-snippets
  :after (yasnippet))

;; 模板生成工具，写代码时随手生成一个模板。强烈推荐使用
;; 使用方法： https://github.com/abo-abo/auto-yasnippet#usage
(use-package auto-yasnippet
  :bind
  (("C-c & w" . aya-create)
   ("C-c & y" . aya-expand))
  :config
  (setq aya-persist-snippets-dir (concat user-emacs-directory "my/snippets")))

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-backends '((company-dabbrev-code company-gtags))
	company-show-numbers t
	company-idle-delay .2
	company-minimum-prefix-length 1))

(use-package flycheck
  :init (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))


(use-package magit)

;; ~/.emacs.d/init.el
(use-package projectile
  :config
  (setq projectile-cache-file (expand-file-name "~/.emacs/.cache/projectile.cache" user-emacs-directory))
  (projectile-mode 1) ;; 全局 enable 这个 minor mode
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))   ;; 定义和它有关的功能的 leader key

(defun my/projectile-add-known-project ()
  (interactive)
  (dired-create-empty-file ".projectile")
  (projectile-add-known-project default-directory)
  )

(provide 'init-misc)
