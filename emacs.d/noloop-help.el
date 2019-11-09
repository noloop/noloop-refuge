(defun try-searches-recursive (searches)
  (cond ((when (car searches)
	   (condition-case err
	       (search-forward (car searches))
	     (search-failed (try-searches-recursive (cdr searches))))))))

(defun noloop-help ()
  (interactive)
  (let ((about (read-string "about? ")))
    (find-file-other-window "~/noloop-refuge/emacs.d/README.org")
    (setq buffer-read-only t)
    (beginning-of-buffer)
    (message "Help about %s" about)
    (try-searches-recursive
     (list (concat "** " about)
	   (concat "*** " about)
	   (concat "**** " about)
	   about))
    (org-cycle)))

(provide 'noloop-help)
