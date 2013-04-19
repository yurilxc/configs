(defun python-mode-settings()
  "Python settings for writings script."
  (interactive())
  (setq python-indent 4)
  (setq tab-width 4))

(add-hook 'python-mode-hook 'python-mode-settings)

(provide 'python-settings)
