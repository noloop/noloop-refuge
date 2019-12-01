(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/bin/sbcl")
(slime-setup '(slime-fancy
	       slime-asdf
	       slime-company
	       slime-repl-ansi-color))

(provide 'noloop-slime)
