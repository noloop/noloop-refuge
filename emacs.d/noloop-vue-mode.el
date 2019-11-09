(setq vue-mode-packages
      '(vue-mode))

(setq vue-mode-excluded-packages '())

(defun vue-mode/init-vue-mode ()
  (use-package vue-mode
               :config
               ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
               (setq mmm-submode-decoration-level 0)))

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil))) ;;"#fafafa"

(provide 'noloop-vue-mode)

