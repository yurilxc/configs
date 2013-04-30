(require 'xcscope)
(require 'cc-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; (defun cscope-switch-symbol(char)
;;   "Move to next or previous symbol with cscope"
;;   (interactive "sswitch symbol:")
;;   (while (or (equal char "n") (equal char "p") (equal char "u"))
;;     (cond ((equal "n" char) (cscope-next-symbol))
;; 	  ((equal "p" char) (cscope-prev-symbol))
;; 	  ((equal "u" char) (progn (cscope-pop-mark)
;; 				   (return))))
;;     (setq char (string (read-char)))))

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
  (define-key map (kbd "C-c d") 'semantic-ia-show-doc)
  (define-key map (kbd "C-c g") 'cscope-find-global-definition)
  (define-key map (kbd "C-c i") 'cscope-find-files-including-file)
  (define-key map (kbd "C-c c") 'cscope-find-functions-calling-this-function)
  (define-key map (kbd "C-c C") 'cscope-find-called-functions)
  ;; (define-key map (kbd "C-c n") 'cscope-switch-symbol)
  (define-key map (kbd "C-c u") 'cscope-pop-mark)
  (define-key map (kbd "<f7>") 'compile)
  (define-key map (kbd "<f8>") 'next-error)
  (define-key map (kbd "<S-f8>") 'previous-error))

(add-hook 'c-mode-hook
	  (lambda () (cc-mode-initialize c-mode-map)))
(add-hook 'c++-mode-hook
	  (lambda () (cc-mode-initialize c++-mode-map)))

(provide 'cc-settings)
