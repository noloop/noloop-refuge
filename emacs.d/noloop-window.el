(setq recenter-redisplay nil)
(desktop-save-mode 1)
(cua-mode t)
(show-paren-mode 1)
(xclip-mode 1)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;;(add-to-list 'load-path "~/.emacs.d/noloop-emacs-conf/contrib/")
;;(load "~/.emacs.d/noloop-emacs-conf/contrib/emacs-application-framework/eaf.el")

(provide 'noloop-window)

