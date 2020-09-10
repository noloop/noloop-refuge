;;; PACKAGES-ARCHIVES
(require 'package) 
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-install 'use-package)

;;; PACKAGES-INSTALL
(require 'cl-lib)
(package-initialize)
(defvar my-packages
  '(srcery-theme
    gruvbox-theme
    company
    neotree
    treemacs
    rainbow-mode
    markdown-mode
    lsp-mode
    lsp-dart
    lsp-ui
    lsp-treemacs
    dart-mode
    flutter
    mmm-mode
    slime
    slime-company
    slime-repl-ansi-color
    smex
    ag
    multiple-cursors
    xclip
    paredit
    expand-region
    magit)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'noloop-packages)
