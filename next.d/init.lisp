(setf +platform-port-command+
      ;; "~/Programs/next-pyqt-webengine/next-pyqt-webengine")
      "~/lisp-dev/next/ports/gtk-webkit/next-gtk-webkit")

(defun my-interface-defaults ()
  (setf (search-engines *interface*)
        '(("default" . "https://duckduckgo.com/?q=~a")
          ("yt" . "https://www.youtube.com/results?search_query=~a")
          ("wiki" . "https://en.wikipedia.org/w/index.php?search=~a")
          ("g" . "https://google.com/search?q=~a"))))

(hooks:add-to-hook '*after-init-hook* #'my-interface-defaults)

(define-command dl (&optional video-url)
  "Download video with youtube-dl in the currently open buffer or optional video-url."
  (launch-and-notify (list "youtube-dl" (or video-url (url (current-buffer)))
        "-o" (format nil "~a/%(title)s.%(ext)s" "/home/noloop/common-lisp/")
        "--write-sub" "--embed-subs" "--all-subs")
                     :success-msg (format nil "Video downloaded to ~a." (or video-url (url (current-buffer))))
                     :error-msg (format nil "Failed to download video.~&")))

(defvar *noloop-keymap* (make-keymap)
  "Keymap for noloop-mode.")

(define-key :keymap *noloop-keymap* "C-p" #'scroll-to-bottom)

(define-mode noloop-mode ()
  "Dummy mode for the custom key bindings in *noloop-keymap*."
  ((keymap-schemes :initform (list :emacs-map *noloop-keymap*
                                   :vi-normal *noloop-keymap*))))

(defun noloop-buffer-defaults (buffer)
  (dolist (mode '(web-mode
                  noloop-mode))
    (pushnew mode (default-modes buffer))))

(defun noloop-interface-defaults ()
  (hooks:add-to-hook (hooks:object-hook *interface* 'buffer-make-hook)
                     #'noloop-buffer-defaults))

(hooks:add-to-hook '*after-init-hook* #'noloop-interface-defaults)


;; (hooks:add-to-hook
;;  (hooks:object-hook *after-init-hook* 'web-mode-hook)
;;  #'(lambda (mode)
;;    (define-key :keymap (getf (keymap-schemes mode) :emacs)
;;      "C-c C-c" #'scroll-to-bottom)))

;; (defvar *noloop-keymap* (make-keymap) "The noloop keymap.")
;;(defun my-test () (print t))
;; (hooks:add-to-hook
;;  '*after-init-hook*
;;  (lambda ()
;;    (print "oioioioioio")
;;    (set-key (getf (keymap-schemes (find-mode (current-buffer) 'my-mode)) :emacs) "M-;" #'scroll-to-bottom)))

