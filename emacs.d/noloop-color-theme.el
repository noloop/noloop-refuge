(defun noloop-theme-srcery ()
  (interactive)
  (load-theme 'srcery t)
  (set-face-attribute 'mode-line nil
		      :background "brightblack"
		      :foreground "brightwhite")

  (set-face-attribute 'mode-line-inactive nil
		      :background "brightblack"
		      :foreground "#262626"))

(defun noloop-theme-gruvbox ()
  (interactive)
  (load-theme 'gruvbox-dark-soft t)
  (set-foreground-color "brightwhite"))

(noloop-theme-srcery)

(provide 'noloop-color-theme)
