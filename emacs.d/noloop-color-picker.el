;; by @phils https://emacs.stackexchange.com/questions/5582/are-there-color-pickers-for-emacs
(defun noloop-color-picker ()
  "Select a color and insert its hexadecimal format."
  (interactive "*")
  (let ((buf (current-buffer)))
    (list-colors-display
     nil nil `(lambda (name)
		(interactive)
		(quit-window)
		(with-current-buffer ,buf
		  (insert (apply 'color-rgb-to-hex
				 (color-name-to-rgb name))))))))

(provide 'noloop-color-picker)
