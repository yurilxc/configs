(load "auctex.el")
(load "preview-latex.el")

(defun TeX-insert-dollar-brace ()
  (interactive ())
  (insert "$$")
  (backward-char))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq TeX-show-compilation nil)
            (setq TeX-save-query nil)
            (TeX-global-PDF-mode t)
            (define-key LaTeX-mode-map (kbd "C-c C-d") 'c-hungry-delete-forward)
            (define-key LaTeX-mode-map (kbd "M-m") 'TeX-insert-dollar-brace)
            (define-key LaTeX-mode-map [f8] 'TeX-next-error)
	    (define-key LaTeX-mode-map "\C-m" 'newline-and-indent)
	    (define-key LaTeX-mode-map "("
	      (lambda ()
		(interactive ())
		(insert "()")
		(backward-char)))
	    (define-key LaTeX-mode-map "{"
	      (lambda ()
		(interactive ())
		(insert "{}")
		(backward-char)))))

(provide 'tex-settings)
