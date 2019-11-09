(setf +platform-port-command+
      ;;"~/common-lisp/next-pyqt-webengine/next-pyqt-webengine")
      "~/common-lisp/next/ports/gtk-webkit/next-gtk-webkit")

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

;; (define-key :keymap (getf (keymap-scheme
;;                         (find-mode (current-buffer) 'web-mode))
;;                        :emacs)
;;  "C-r" #'scroll-to-bottom)

;;#'scroll-to-top

