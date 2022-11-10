(setq inhibit-compacting-font-caches t)

;; (defun set-font (english chinese english-size chinese-size)
;;   (set-face-attribute 'default nil :font
;;                       ;; (format   "%s:pixelsize=%d"  english english-size) :weight 'semi-bold)
;;                       (format   "%s:pixelsize=%d"  english english-size))

;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font) charset

;;                       (font-spec :family chinese :size chinese-size :weight 'medium))))

;; (set-font "Cascadia Mono" "思源黑体 Medium" 20 20)

(set-face-attribute
 'default nil
 :font (font-spec :family "Cascadia Code"
                  :weight 'regular
                  :slant 'normal)
 :height 160)

(set-face-attribute
 'fixed-pitch nil
 :font (font-spec :family "Cascadia Code"
                  :weight 'regular
                  :slant 'normal)
 :height 160)


(set-face-attribute
  'variable-pitch nil
  :font (font-spec :name "Verdana"
                   :weight 'normal
                   :slant 'normal)
  :height 160)

(when (display-graphic-p)
  (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "苹方-简"
                :weight 'regular
                ))))

(provide 'init-fonts)
