(setq inhibit-compacting-font-caches t)

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      ;; (format   "%s:pixelsize=%d"  english english-size) :weight 'semi-bold)
                      (format   "%s:pixelsize=%d"  english english-size))

  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset

                      (font-spec :family chinese :size chinese-size :weight 'medium))))

(set-font "Cascadia Mono" "思源黑体 Medium" 20 20)

;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :family "JetBrainsMono NF"
;;                   :weight 'normal
;;                   :slant 'normal)
;;  :height 130)

;; (set-fontset-font "fontset-default" 'unicode
;;     (font-spec :name "Symbola" :size 15.0))

;; (set-face-attribute
;;   'variable-pitch nil
;;   :font (font-spec :name "Sarasa UI SC"
;;                    :weight 'normal
;;                    :slant 'normal)
;;   :height 130)

;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;  (set-fontset-font
;;   (frame-parameter nil 'font)
;;   charset
;; ;;  (font-spec :name "Noto Sans CJK SC"
;;   (font-spec :name "Sarasa UI SC"
;;              :weight 'normal
;;              :slant 'normal
;;              :size 13.0)))


(provide 'init-fonts)
