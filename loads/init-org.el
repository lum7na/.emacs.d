(setq fixed-pitch-faces
  '(diff-added
    diff-context
    diff-file-header
    diff-function
    diff-header
    diff-hunk-header
    diff-removed
    font-latex-math-face
    font-latex-sedate-face
    font-latex-warning-face
    font-latex-sectioning-5-face
    font-lock-builtin-face
    font-lock-comment-delimiter-face
    font-lock-constant-face
    font-lock-doc-face
    font-lock-function-name-face
    font-lock-keyword-face
    font-lock-negation-char-face
    font-lock-preprocessor-face
    font-lock-regexp-grouping-backslash
    font-lock-regexp-grouping-construct
    font-lock-string-face
    font-lock-type-face
    font-lock-variable-name-face
    line-number
    line-number-current-line
    line-number-major-tick
    line-number-minor-tick
    message-header-name
    message-header-to
    message-header-cc
    message-header-newsgroups
    message-header-xheader
    message-header-subject
    message-header-other
    org-block
    ;;org-block-begin-line
    ;;org-block-end-line
    org-document-info-keyword
    org-code
    org-indent
    org-latex-and-related
    org-checkbox
    org-formula
    ;;org-meta-line
    org-table
    org-verbatim
    ))


(use-package org
  :config
  (require 'org-faces)
  (require 'font-latex)
  (add-hook 'org-mode-hook (lambda ()
                             (dolist (face fixed-pitch-faces)  (set-face-attribute face nil :inherit 'fixed-pitch))))

  (add-hook 'org-mode-hook (lambda () (set-face-attribute 'org-indent nil :foreground "#F5F5F5")))
  (let* ((variable-tuple
          (cond ((x-list-fonts "Sarasa SC")    '(:font "Sarasa SC"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.15))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.3))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))
    )

  ;;(require 'org-variable-pitch)
  ;;(add-hook 'org-mode-hook
  ;;        (lambda ()
  ;;(org-cycle-hide-drawers 'all)
  ;;         (org-indent-mode 1)))
  (setq org-startup-indented t)
  (add-hook 'org-mode-hook 'org-num-mode)
  (add-hook 'org-mode-hook 'variable-pitch-mode)

  (setq org-link-frame-setup
        '((vm . vm-visit-folder-other-frame)
          (vm-imap . vm-visit-imap-folder-other-frame)
          (gnus . org-gnus-no-new-news)
          (file . find-file)
          (wl . wl-other-frame)))
  

  (setq org-hide-emphasis-markers t
        org-fontify-done-headline t
        org-hide-leading-stars t
        org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t
        org-ellipsis "…")
  
  ;; Open org files with previewing
  (setq org-startup-with-inline-images t)
  ;;(setq org-startup-with-latex-preview t)
  
  (require 'org-indent)
  ;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  ;; (setq  org-indent-indentation-per-level 4)
  ;; (setq org-image-actual-width nil)
  (setq org-image-actual-width '(500)) ;; 默认inline display图片宽度
  ;;      ) 

  (setq org-preview-latex-process-alist '((dvipng :programs
                                                  ("latex" "dvipng")
                                                  :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
                                                  (1.0 . 1.0)
                                                  :latex-compiler
                                                  ("latex -interaction nonstopmode -shell-escape -output-directory %o %f")
                                                  :image-converter
                                                  ("dvipng -D %D -T tight -o %O %f"))
                                          (dvisvgm :programs
                                                   ("latex" "dvisvgm")
                                                   :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :image-input-type "dvi" :image-output-type "svg" :image-size-adjust
                                                   (1.7 . 1.5)
                                                   :latex-compiler
                                                   ("latex -interaction nonstopmode -output-directory %o %f")
                                                   :image-converter
                                                   ("dvisvgm %f -n -b min -c %S -o %O"))
                                          (imagemagick :programs
                                                       ("latex" "convert")
                                                       :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
                                                       (1.0 . 1.0)
                                                       :latex-compiler
                                                       ("pdflatex -interaction nonstopmode -output-directory %o %f")
                                                       :image-converter
                                                       ("convert -density %D -trim -antialias %f -quality 100 %O"))))
  
  (with-eval-after-load 'ox-latex ;; 在 ox-latex 启动后
    (setq org-latex-pdf-process ;; 编译生成 pdf 的命令
          '("xelatex -shell-escape -file-line-error -interaction nonstopmode %f"
            "bibtex %b"
            "xelatex -shell-escape -file-line-error -interaction nonstopmode %f"
            "xelatex -shell-escape -file-line-error -interaction nonstopmode %f"
	    "rm -rf auto")
          org-latex-logfiles-extensions ;; 在生成 pdf 后默认删除的中间文件
	  (quote ("lof" "lot" "tex~" "tex" "aux" 
		  "idx" "log" "out" "toc" "nav" 
		  "snm" "vrb" "dvi" "fdb_latexmk" 
		  "blg" "brf" "fls" "entoc" "ps" 
		  "spl" "bbl" "xdv"))
          org-export-with-sub-superscripts nil ;; 默认不转义 _ 和 ^ 上下标
          )
    (add-to-list 'org-latex-classes ;; 设置 latex template elegantpaper
	         '("elegantpaper"
                   "\\documentclass[lang=cn,a4paper]{elegantpaper}
                 [NO-DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
	           ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes ;; 设置 latex template elegantnote
	         '("elegantnote"
                   "\\documentclass[lang=cn,device=normal,color=black,8pt]{elegantnote}
                 [NO-DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
	           ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    ;; (add-to-list 'org-latex-packages-alist '("cachedir=\\string~/.emacs.d/xenops/cache/" "minted")) ;; 添加额外包minted: 代码高亮
    (add-to-list 'org-latex-packages-alist '("" "mathrsfs")) ;; 添加额外包ulem：下划线
    
    (setq org-latex-listings 'minted  ;; 代码高亮包minted 需要安装Pygments
          org-latex-minted-options ;; minted参数
          '(("frame=lines") ("breaklines=true") ("fontsize=\\small") ("baselinestretch=1")))
    (add-to-list 'org-latex-packages-alist
	         '("cache=false" "minted" t))

    (setq org-publish-project-alist ;; org-publish 导出项目，将org-roam下所有文件导出为pdf
          (backquote (("org-roam"
                       :base-directory ,my-org-roam-path
                       :base-extension "org"
                       :publishing-directory ,(concat my-org-roam-path "output") ;; 导出位置
                       :publishing-function org-latex-publish-to-pdf
                       :latex-compiler "xelatex"
                       :latex-class "elegantnote"
                       )))))
  )

(use-package org-appear
  :config (add-hook 'org-mode-hook 'org-appear-mode)
  (setq org-appear-autolinks t))

;;(use-package org-fragtog
;;  :config
;;  (add-hook 'org-mode-hook 'org-fragtog-mode))
(use-package xenops
  :config
  (add-hook 'latex-mode-hook #'xenops-mode)
  (add-hook 'LaTeX-mode-hook #'xenops-mode)
  (add-hook 'org-mode-hook  #'xenops-mode)
  (setq xenops-math-image-scale-factor 0.8)
  (setq xenops-reveal-on-entry t))
;;(setq org-latex-preview-ltxpng-directory "~/.emacs.d/ltximg/")

;; (use-package org-superstar ;; org-mode 标题符号美化插件
;;   :hook (org-mode . org-superstar-mode)
;;   :config
;;   ;; This is usually the default, but keep in mind it must be nil
;;   (setq org-hide-leading-stars t)
;;   ;; This line is necessary.
;;   (setq org-superstar-leading-bullet ?\s)
;;   ;; If you use Org Indent you also need to add this, otherwise the
;;   ;; above has no effect while Indent is enabled.
;;   (setq org-indent-mode-turns-on-hiding-stars nil)
;;   (setq org-superstar-headline-bullets-list '(9673 9675))
;;   )

(use-package org-modern
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
  (setq org-modern-table nil) ;; conflict with valign mode, disabled
  )


(use-package org-download ;; org-mode 图片剪贴板导入与下载
  :config
  (setq-default org-download-image-dir "./images/" ;; 设置默认图片保存目录
                org-download-screenshot-method "magick clipboard: %s" ;; 截图工具
                org-download-heading-lvl nil) ;; 指定图片的 Heading level
  (setq org-download-display-inline-images nil) ;; 插入图片后默认不显示
  (add-hook 'dired-mode-hook 'org-download-enable) ;; 在 dired mode 中开启 org-download-mode
  )

(defun my/org-download-clipboard (&optional basename)
  "Capture the image from the clipboard and insert the resulting file."
  (interactive)
  (let ((org-download-screenshot-method
         (cl-case system-type
           (gnu/linux
            (if (string= "wayland" (getenv "XDG_SESSION_TYPE"))
                (if (executable-find "wl-paste")
                    "wl-paste -t image/png > %s"
                  (user-error
                   "Please install the \"wl-paste\" program included in wl-clipboard"))
              (if (executable-find "xclip")
                  "xclip -selection clipboard -t image/png -o > %s"
                (user-error
                 "Please install the \"xclip\" program"))))
           ((windows-nt cygwin)
            (if (executable-find "magick")
                "magick clipboard: %s"
              (user-error
               "Please install the \"magick\" program included in ImageMagick")))
           ((darwin berkeley-unix)
            (if (executable-find "pngpaste")
                "pngpaste %s"
              (user-error
               "Please install the \"pngpaste\" program from Homebrew."))))))
    (org-download-screenshot basename)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename my-org-roam-path))
  :config
  (org-roam-db-autosync-enable)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol)
  )

(use-package org-roam-ui
  :quelpa (org-roam-ui :fetcher github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package org-protocol-capture-html
  :quelpa (org-protocol-capture-html :fetcher github :repo "alphapapa/org-protocol-capture-html"))


(use-package org-ref
  :config
  ;; Org-ref
  ;; Set up bibliography
  (setq bibtex-completion-bibliography (concat my-zotero-path "export.bib"))
  (global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link))

(use-package ivy-bibtex)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (call-process "Acrobat.exe" nil 0 nil fpath)))


(use-package org-roam-bibtex
  :config
  (setq bibtex-completion-bibliography (concat my-zotero-path "export.bib"))
  (add-hook 'after-init-hook #'org-roam-bibtex-mode)
  (define-key org-roam-bibtex-mode-map (kbd "C-c w a") #'orb-note-actions)
  (setq bibtex-completion-pdf-field "file")
  (setq orb-preformat-keywords
	'(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords"))


  (setq org-ref-get-pdf-filename-function
	(lambda (key) (car (bibtex-completion-find-pdf key)))))

;; (use-package org-noter
;;   :config
;;   (setq org-noter-notes-search-path (list my-org-roam-path))
;;   (require 'org-noter-pdftools))

;; (use-package org-pdftools
;;   :hook (org-mode . org-pdftools-setup-link))

;; (use-package org-noter-pdftools
;;   :after org-noter
;;   :config
;;   ;; Add a function to ensure precise note is inserted
;;   (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
;;     (interactive "P")
;;     (org-noter--with-valid-session
;;      (let ((org-noter-insert-note-no-questions (if toggle-no-questions
;;                                                    (not org-noter-insert-note-no-questions)
;;                                                  org-noter-insert-note-no-questions))
;;            (org-pdftools-use-isearch-link t)
;;            (org-pdftools-use-freestyle-annot t))
;;        (org-noter-insert-note (org-noter--get-precise-info)))))

;;   ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
;;   (defun org-noter-set-start-location (&optional arg)
;;     "When opening a session with this document, go to the current location.
;; With a prefix ARG, remove start location."
;;     (interactive "P")
;;     (org-noter--with-valid-session
;;      (let ((inhibit-read-only t)
;;            (ast (org-noter--parse-root))
;;            (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
;;        (with-current-buffer (org-noter--session-notes-buffer session)
;;          (org-with-wide-buffer
;;           (goto-char (org-element-property :begin ast))
;;           (if arg
;;               (org-entry-delete nil org-noter-property-note-location)
;;             (org-entry-put nil org-noter-property-note-location
;;                            (org-noter--pretty-print-location location))))))))
;;   (with-eval-after-load 'pdf-annot
;;     (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))


;; (pdf-tools-install)

(setq org-file-apps
      '(("\\.pdf\\'" . "chrome.exe %s")
;;        (auto-mode . emacs)
;;        (directory . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)))

;; (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward-regexp)
;; (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward-regexp)

;; hide :PROPERTY: in org mode
;; (defun org-cycle-hide-drawers (state)
;;   "Re-hide all drawers after a visibility state change."
;;   (when (and (derived-mode-p 'org-mode)
;;              (not (memq state '(overview folded contents))))
;;     (save-excursion
;;       (let* ((globalp (memq state '(contents all)))
;;              (beg (if globalp
;;                     (point-min)
;;                     (point)))
;;              (end (if globalp
;;                     (point-max)
;;                     (if (eq state 'children)
;;                       (save-excursion
;;                         (outline-next-heading)
;;                         (point))
;;                       (org-end-of-subtree t)))))
;;         (goto-char beg)
;;         (while (re-search-forward org-drawer-regexp end t)
;;           (save-excursion
;;             (beginning-of-line 1)
;;             (when (looking-at org-drawer-regexp)
;;               (let* ((start (1- (match-beginning 0)))
;;                      (limit
;;                        (save-excursion
;;                          (outline-next-heading)
;;                            (point)))
;;                      (msg (format
;;                             (concat
;;                               "org-cycle-hide-drawers:  "
;;                               "`:END:`"
;;                               " line missing at position %s")
;;                             (1+ start))))
;;                 (if (re-search-forward "^[ \t]*:END:" limit t)
;;                   (outline-flag-region start (point-at-eol) t)
;;                   (user-error msg))))))))))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?" :if-new
         (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                    "#+title: ${title}\n#+SETUPFILE: ~/.emacs.d/loads/org-header.setup\n") :unnarrowed t)
        ("r" "bibliography reference" plain "%?"
         :target
         (file+head "%<%Y%m%d%H%M%S>-${citekey}.org"
                    "#+title: ${title}\n#+ROAM_KEY: ${ref}\n#+SETUPFILE: ~/.emacs.d/loads/org-header.setup\n\n
* ${title}
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:NOTER_DOCUMENT: =${file}=
:END:")
         :unnarrowed t)))

(defun org-html-export-to-html
    (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let* ((extension (concat "." org-html-extension))
	 (file (org-export-output-file-name extension subtreep "~/exports/"))
	 (org-export-coding-system org-html-coding-system))
    (if async
	(org-export-async-start
         (lambda (f) (org-export-add-to-stack f 'html))
	 (let ((org-export-coding-system org-html-coding-system))
           `(expand-file-name
             (org-export-to-file
	      'html ,file ,subtreep ,visible-only ,body-only ',ext-plist))))
      (let ((org-export-coding-system org-html-coding-system))
	(org-export-to-file
	 'html file subtreep visible-only body-only ext-plist)))))

(global-set-key (kbd "C-. o p") 'org-html-export-to-html)


;; org-latex

;;(use-package cdlatex)
;;(add-hook 'org-mode-hook 'turn-on-org-cdlatex)


(use-package aas
  :hook (LaTeX-mode . aas-activate-for-major-mode)
  :hook (org-mode . aas-activate-for-major-mode))
;; 支持 latex 公式快速输入
(use-package laas
  :hook (LaTeX-mode . laas-mode)
  :hook (org-mode . laas-mode)
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
                    ;; set condition!
                    :cond #'texmathp ; expand only while in math
                    "Olon" "O(n \\log n)"
                    ;; bind to functions!
                    "Sum" (lambda () (interactive)
                            (yas-expand-snippet "\\sum_{$1}^{$2} $0"))
                    "_" (lambda () (interactive)
                          (yas-expand-snippet "_{$1}$0"))
                    "tex" (lambda () (interactive)
                            (yas-expand-snippet "\\text{$1}$0"))
                    ;; add accent snippets
                    :cond #'laas-object-on-left-condition
                    "qq" (lambda () (interactive) (laas-wrap-previous-object "sqrt"))))

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t))
(plist-put org-format-latex-options :scale 1.1)

(setq org-highlight-latex-and-related '(latex script entities))

(use-package valign
  :config
  (add-hook 'org-mode-hook #'valign-mode))

(use-package ox-pandoc)

;; (use-package org-pomodoro
;;   :config
;;   (setq org-pomodoro-length 45
;;         org-pomodoro-short-break-length 8
;;         org-pomodoro-long-break-length 20)
;;   (add-hook 'org-pomodoro-finished-hook
;;             (lambda ()
;;               (org-notify "A pomodoro is finished, take a break !!!")
;;               ))
;;   (add-hook 'org-pomodoro-short-break-finished-hook
;;             (lambda ()
;;               (org-notify "A short break done, ready a new pomodoro !!!")
;;               ))
;;   (add-hook 'org-pomodoro-long-break-finished-hook
;;             (lambda ()
;;               (org-notify "A long break done, ready a new pomodoro !!!")
;;               )))

;; ;;;; org-agenda setting

;; (setq org-agenda-prefix-format '((agenda . " %i %-36(my/org-file-get-title) %?-12t% s")
;;                                  (todo . " %i %-36(my/org-file-get-title) ")
;;                                  (tags . " %i %-36(my/org-file-get-title) ")
;;                                  (search . " %i %-36(my/org-file-get-title)")))


;; (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;; ;;(setq org-agenda-files `(,my-org-roam-path
;; ;;                         ,(concat my-org-roam-path "agenda/")
;; ;;                         )) ;; org agenda 文件位置

;; (setq org-agenda-files `(,(concat my-org-roam-path "agenda/"))) ;; org agenda 文件位置

;; (setq org-todo-keywords
;;       (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; (setq org-todo-keyword-faces
;;       (quote (("TODO" :foreground "red" :weight bold)
;;               ("NEXT" :foreground "blue" :weight bold)
;;               ("DONE" :foreground "forest green" :weight bold)
;;               ("WAITING" :foreground "orange" :weight bold)
;;               ("HOLD" :foreground "magenta" :weight bold)
;;               ("CANCELLED" :foreground "forest green" :weight bold)
;;               ("MEETING" :foreground "forest green" :weight bold)
;;               ("PHONE" :foreground "forest green" :weight bold))))

;; (setq org-todo-state-tags-triggers
;;       (quote (("CANCELLED" ("CANCELLED" . t))
;;               ("WAITING" ("WAITING" . t))
;;               ("HOLD" ("WAITING") ("HOLD" . t))
;;               (done ("WAITING") ("HOLD"))
;;               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
;;               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
;;               ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; (setq org-use-fast-todo-selection t)
;; (setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; (setq org-default-notes-file (concat my-org-roam-path "agenda/refile.org"))

;; ;;;; org-refile setup
;; ;;;; key binding: in org-agenda mode
;; ;;;; move to Tasks to refile section
;; ;;;; m to mark task
;; ;;;; B r to select destination

;;                                         ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
;; (setq org-refile-targets (quote ((nil :maxlevel . 9)
;;                                  (org-agenda-files :maxlevel . 9))))

;;                                         ; Use full outline paths for refile targets - we file directly with IDO
;; (setq org-refile-use-outline-path t)

;;                                         ; Targets complete directly with IDO
;; (setq org-outline-path-complete-in-steps nil)

;;                                         ; Allow refile to create parent tasks with confirmation
;; (setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
;;(setq org-completion-use-ido t)
;;(setq ido-everywhere t)
;;(setq ido-max-directory-size 100000)
;;(ido-mode (quote both))
                                        ; Use the current window when visiting files and buffers with ido
;;(setq ido-default-file-method 'selected-window)
;;(setq ido-default-buffer-method 'selected-window)
                                        ; Use the current window for indirect buffer display
;;(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
                                        ; Exclude DONE state tasks from refile targets

;; (setq org-refile-target-verify-function 'bh/verify-refile-target)

;; ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; (setq org-capture-templates
;;       `(("t" "todo" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;;         ("r" "respond" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;;         ("n" "note" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;;         ("r" "org-protocol" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* TODO Review %c\n%U\n" :immediate-finish t)
;;         ("m" "Meeting" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;;         ("p" "Phone call" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;;         ("h" "Habit" entry (file ,(concat my-org-roam-path "agenda/refile.org"))
;;          "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
;;         ("w" "Web site" entry
;;          (file "")
;;          "* %a :website:\n\n%U %?\n\n%:initial")))



;; ;; Do not dim blocked tasks
;; (setq org-agenda-dim-blocked-tasks nil)

;; ;; Compact the block agenda view
;; (setq org-agenda-compact-blocks t)

;; ;; Custom agenda command definitions
;; (add-to-list 'org-modules 'org-habit)

;; (setq org-agenda-custom-commands
;;       (quote (("N" "Notes" tags "NOTE"
;;                ((org-agenda-overriding-header "Notes")
;;                 (org-tags-match-list-sublevels t)))
;;               ("h" "Habits" tags-todo "STYLE=\"habit\""
;;                ((org-agenda-overriding-header "Habits")
;;                 (org-agenda-sorting-strategy
;;                  '(todo-state-down effort-up category-keep))))
;;               ("d" "Agenda"
;;                ((agenda "" nil)
;;                 (tags "REFILE"
;;                       ((org-agenda-overriding-header "Tasks to Refile")
;;                        (org-tags-match-list-sublevels nil)))
;;                 (tags-todo "-CANCELLED/!"
;;                            ((org-agenda-overriding-header "Stuck Projects")
;;                             (org-agenda-skip-function 'bh/skip-non-stuck-projects)
;;                             (org-agenda-sorting-strategy
;;                              '(category-keep))))
;;                 (tags-todo "-HOLD-CANCELLED/!"
;;                            ((org-agenda-overriding-header "Projects")
;;                             (org-agenda-skip-function 'bh/skip-non-projects)
;;                             (org-tags-match-list-sublevels 'indented)
;;                             (org-agenda-sorting-strategy
;;                              '(category-keep))))
;;                 (tags-todo "-CANCELLED/!NEXT"
;;                            ((org-agenda-overriding-header (concat "Project Next Tasks"
;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                       ""
;;                                                                     " (including WAITING and SCHEDULED tasks)")))
;;                             (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
;;                             (org-tags-match-list-sublevels t)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-sorting-strategy
;;                              '(todo-state-down effort-up category-keep))))
;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
;;                            ((org-agenda-overriding-header (concat "Project Subtasks"
;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                       ""
;;                                                                     " (including WAITING and SCHEDULED tasks)")))
;;                             (org-agenda-skip-function 'bh/skip-non-project-tasks)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-sorting-strategy
;;                              '(category-keep))))
;;                 (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
;;                            ((org-agenda-overriding-header (concat "Standalone Tasks"
;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                       ""
;;                                                                     " (including WAITING and SCHEDULED tasks)")))
;;                             (org-agenda-skip-function 'bh/skip-project-tasks)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-sorting-strategy
;;                              '(category-keep))))
;;                 (tags-todo "-CANCELLED+WAITING|HOLD/!"
;;                            ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
;;                                                                   (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                       ""
;;                                                                     " (including WAITING and SCHEDULED tasks)")))
;;                             (org-agenda-skip-function 'bh/skip-non-tasks)
;;                             (org-tags-match-list-sublevels nil)
;;                             (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                             (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
;;                 (tags "-REFILE/"
;;                       ((org-agenda-overriding-header "Tasks to Archive")
;;                        (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
;;                        (org-tags-match-list-sublevels nil))))
;;                nil))))

;; ;;;; clock setting
;; ;;
;; ;; Resume clocking task when emacs is restarted
;; (org-clock-persistence-insinuate)
;; ;;
;; ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
;; (setq org-clock-history-length 23)
;; ;; Resume clocking task on clock-in if the clock is open
;; (setq org-clock-in-resume t)
;; ;; Change tasks to NEXT when clocking in
;; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; ;; Separate drawers for clocking and logs
;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; ;; Save clock data and state changes and notes in the LOGBOOK drawer
;; (setq org-clock-into-drawer t)
;; ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
;; (setq org-clock-out-remove-zero-time-clocks t)
;; ;; Clock out when moving task to a done state
;; (setq org-clock-out-when-done t)
;; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
;; (setq org-clock-persist t)
;; ;; Do not prompt to resume an active clock
;; (setq org-clock-persist-query-resume nil)
;; ;; Enable auto clock resolution for finding open clocks
;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; ;; Include current clocking task in clock reports
;; (setq org-clock-report-include-clocking-task t)

;; (setq bh/keep-clock-running nil)

;; (setq org-agenda-clockreport-parameter-plist
;;       (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

;; (setq org-archive-location "%s_archive::* Archived Tasks")



(major-mode-hydra-define org-mode nil
  ("Org"
   (("a" org-agenda "agenda")
    ("ch" org-toggle-checkbox "toggle checkbox")
    ("ph" (org-cycle-hide-drawers 'all) "hide drawers")
    ("ps" org-show-all "show drawers"))
   "Org Roam"
   (("oi" org-roam-node-insert "insert")
    ("of" org-roam-node-find "find")
    ("oc" org-roam-capture "capture")
    ("ol" org-roam-buffer-toggle "buffer toggle")
    ("u" org-roam-ui-mode "ui mode" :toggle t))
   "Image"
   (("dc" my/org-download-clipboard "insert clipboard")
    ("i" org-toggle-inline-images "display image" :toggle t))
   "Latex"
   (("l" org-latex-preview "display equation" :toggle t))
   "Export"
   (("ep" org-pandoc-export-to-latex-pdf "pandoc to latex pdf")
    ("eo" org-pandoc-export-to-latex-pdf-and-open "pandoc to latex pdf and open"))
   ))

;; (pretty-hydra-define org-gtd
;;   (:color amaranth :quit-key "q" :title "GTD")
;;   ("Agenda"
;;    (("a" org-agenda "agenda" :exit t)
;;     ("c" org-capture "capture" :exit t))
;;    "Timer"
;;    (("i" bh/punch-in "start timer" :exit t)
;;     ("o" bh/punch-out "stop timer" :exit t)))
;;   )

(provide 'init-org)
