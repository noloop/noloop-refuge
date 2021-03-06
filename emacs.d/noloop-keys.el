;;; F-keys
(global-set-key [f4] 'spell-checker)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'treemacs)

;;; C-x C-keys
(global-set-key (kbd "C-x C-e")
		(lambda () (interactive) (load-file "~/.emacs.d/init.el")))
;;; C-x keys
(global-set-key (kbd "C-x o") 'other-window)
(defun prev-window () (interactive) (other-window -1))
(global-set-key (kbd "C-x p") 'prev-window)
(global-set-key (kbd "C-x g") 'magit-status)

;;; C-c C-keys
(global-set-key (kbd "C-c C-a") 'windmove-left)
(global-set-key (kbd "C-c C-d") 'windmove-right)
(global-set-key (kbd "C-c C-w") 'windmove-up)
(global-set-key (kbd "C-c C-s") 'windmove-down)

;;; C-c keys
(global-set-key (kbd "C-c 0")
                (lambda () (interactive)
                  (neotree-dir "~/noloop-refuge/")))
(global-set-key (kbd "C-c 1") 
		(lambda () (interactive)
		  (neotree-dir "~/Development/lisp-dev/")))
(global-set-key (kbd "C-c 2") 
		(lambda () (interactive) 
		  (neotree-dir "~/Development/c-dev/")))
(global-set-key (kbd "C-c 3") 
		(lambda () (interactive) 
		  (neotree-dir "~/Development/javascript-dev/")))
(global-set-key (kbd "C-c 4") 
		(lambda () (interactive) 
		  (neotree-dir "~/Development/android-dev/")))
(global-set-key (kbd "C-c 5") 
		(lambda () (interactive) 
		  (neotree-dir "~/Development/flutter-dev/")))
(global-set-key (kbd "C-c 6") 
		(lambda () (interactive) 
		  (neotree-dir "~/Development/html-dev/")))
(global-set-key (kbd "C-c 7") 
		(lambda () (interactive) 
		  (neotree-dir "~/common-lisp/")))
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)

;;; M-keys
(global-set-key (kbd "M-;") 'mc/mark-all-like-this)
(global-set-key (kbd "M-~") 'er/expand-region)

(provide 'noloop-keys)
