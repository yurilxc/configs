(add-hook 'org-mode-hook
          (lambda()
            (define-key org-mode-map (kbd "C-c C-d") 'c-hungry-delete-forward)
            (define-key org-mode-map "\C-m" 'newline-and-indent)))

(provide 'org-settings)
