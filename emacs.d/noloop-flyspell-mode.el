(require 'ispell)
(require 'flyspell)

(setenv "DICPATH" "~/.emacs.d/noloop-emacs-conf/dictionaries/")
(setq ispell-program-name "hunspell")

(defun spell-checker ()
  "spell checker (on/off) with selectable dictionary"
  (interactive)
  (if flyspell-mode
      (flyspell-mode-off)
      (progn
        (flyspell-mode 1)
        (ispell-change-dictionary
         (completing-read
          "Use new dictionary (RET for *default*): "
          (and (fboundp 'ispell-valid-dictionary-list)
               (mapcar 'list (ispell-valid-dictionary-list)))
          nil t)))))

(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 120)

(provide 'noloop-flyspell-mode)
