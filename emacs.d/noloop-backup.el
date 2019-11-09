(let ((backups-dir "~/.backups/")
      (emacs-backup-dir "~/.backups/emacs/")
      (emacs-auto-saves-dir "~/.backups/emacs/auto-saves/"))
  (dolist (dir (list backups-dir emacs-backup-dir emacs-auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,emacs-backup-dir))
        auto-save-file-name-transforms `((".*" ,emacs-auto-saves-dir t))
        auto-save-list-file-prefix (concat emacs-auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,emacs-backup-dir))
        tramp-auto-save-directory emacs-auto-saves-dir))

(setq backup-by-copying t                        
      delete-old-versions t
      version-control t
      kept-new-versions 5
      kept-old-versions 2)

(provide 'noloop-backup)
