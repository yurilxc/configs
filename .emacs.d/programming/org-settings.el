(eval-after-load "org"
  `(let ((map org-mode-map))
     (define-key map (kbd "C-c C-d") 'c-hungry-delete-forward)
     (define-key map "\C-m" 'newline-and-indent)))

(provide 'org-settings)
