(add-to-list 'auto-mode-alist '("\\.el\\'" . lisp-interaction-mode))
(add-to-list 'auto-mode-alist '("\\.emacs\\'" . lisp-interaction-mode))

(defun lisp-insert-parenthesis()
  (interactive ())
  (insert "()")
  (backward-char))

(define-key lisp-interaction-mode-map "\C-m" 'newline-and-indent)
(define-key lisp-interaction-mode-map "(" 'lisp-insert-parenthesis)

(provide 'lisp-settings)
