(require 'neotree)
(setq neo-autorefresh t)
(neotree-dir "~/noloop-refuge/emacs.d/")
(setq neo-hidden-regexp-list
      '("^\\."
	"\\.tmp"
	"\\.temp"
	"\\.cs\\.meta$"
	"\\.pyc$"
	"~$"
	"^#.*#$"
	"\\.elc$"))

(provide 'noloop-neotree)
