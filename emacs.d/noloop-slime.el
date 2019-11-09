(setq inferior-lisp-program "/bin/sbcl")
(slime-setup '(slime-fancy slime-asdf
			   slime-company))

(provide 'noloop-slime)
