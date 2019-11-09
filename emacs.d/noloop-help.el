;;https://gist.github.com/jteneycke/7947353
;;http://danmidwood.com/content/2014/11/21/animated-paredit.html
;;http://pragmaticemacs.com/emacs/multiple-cursors/
;;https://github.com/magnars/expand-region.el
;;https://github.com/atlas-engineer/next

(defun try-searches-recursive (searches)
  (cond ((when (car searches)
	   (condition-case err
	       (search-forward (car searches))
	     (search-failed (try-searches-recursive (cdr searches))))))))

(defun noloop-help ()
  (interactive)
  (let ((about (read-string "about? ")))
    (find-file-other-window "~/.emacs.d/noloop-emacs-conf/README.md")
    (setq buffer-read-only t)
    (beginning-of-buffer)
    (message "Help about %s" about)
    (try-searches-recursive
     (list (concat "## " about)
	   (concat "### " about)
	   (concat "#### " about)
	   about))))

(provide 'noloop-help)
