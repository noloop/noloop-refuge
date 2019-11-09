;;; PACKAGES-ARCHIVES
(require 'package) 
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"));;(add-to-list 'packages-archives '("melpa" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; PACKAGES-INSTALL
(require 'cl-lib)
(package-initialize)
(defvar my-packages
  '(use-package
    srcery-theme
    gruvbox-theme
    company
    neotree
    rainbow-mode
    markdown-mode
    vmd-mode
    dart-mode
    flutter
    mmm-mode
    vue-mode
    slime
    slime-company
    smex
    ag
    multiple-cursors
    xclip)
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
