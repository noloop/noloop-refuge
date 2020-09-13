(setq recenter-redisplay nil)
(desktop-save-mode 1)
(cua-mode t)
(show-paren-mode 1)
(xclip-mode 1)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; Disable Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
;; Enable windows Style Undo
(global-set-key [(control z)] 'undo)

(provide 'noloop-window)

