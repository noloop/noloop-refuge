(if (not (file-exists-p "~/.backups/emacs/"))
    (make-directory "~/.backups/emacs/" t))

(setq backup-directory-alist
      `((".*" . "~/.backups/emacs/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.backups/emacs/" t)))

(defun make-backup-file-name (FILE)
  (let ((dirname (concat "~/.backups/emacs/"
			 (format-time-string "%y/%m/%d/"))))
    (if (not (file-exists-p dirname))
	(make-directory dirname t))
    (concat dirname (file-name-nondirectory FILE))))

(provide 'noloop-backup)
