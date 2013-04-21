(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))

(add-hook
 'c++-mode-hook
 '(lambda ()
    (let ((map c++-mode-map))
      (linum-mode 1)
      ;; blanks instead of tabs
      (setq indent-tabs-mode nil)
      (setq tab-width 4)
      (setq c-basic-offset 4)
      (add-to-list 'ac-sources 'ac-source-semantic)
      (add-to-list 'ac-sources 'ac-source-semantic-raw)
      (define-key map (kbd "<f7>") 'compile)
      (define-key map (kbd "<f8>") 'next-error)
      (define-key map (kbd "<S-f8>") 'previous-error))))

;; semantic
(setq semantic-default-submodes 
      '(global-semantic-idle-scheduler-mode
        global-semanticdb-minor-mode
        global-semantic-idle-local-symbol-highlight-mode
        global-semantic-show-parser-state-mode
	))
(semantic-mode 1)

(provide 'cc-settings)
