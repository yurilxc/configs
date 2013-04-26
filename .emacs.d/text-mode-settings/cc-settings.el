(require 'xcscope)
(require 'cc-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

(defun cc-mode-initialize (map)
  (interactive ())
  (linum-mode 1)
  ;; blanks instead of tabs
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (add-to-list 'ac-sources 'ac-source-semantic-raw)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (setq ac-sources (remove 'ac-source-yasnippet ac-sources))
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (define-key map (kbd "<f7>") 'compile)
  (define-key map (kbd "<f8>") 'next-error)
  (define-key map (kbd "<S-f8>") 'previous-error))

(add-hook 'c-mode-hook
	  (lambda () (cc-mode-initialize c-mode-map)))
(add-hook 'c++-mode-hook
	  (lambda () (cc-mode-initialize c++-mode-map)))

(provide 'cc-settings)
