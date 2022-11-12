(defvar in-gui (display-graphic-p))
(defvar my-org-roam-path "/Users/lum7na/org-roam/")
(defvar my-zotero-path "/Users/lum7na/zotero/")
(defvar init-magic nil)
(defvar init-scala-lsp t)


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

(defvar init-lsp-lock t)

(provide 'init-vars)
