;; c-comment-style
(setq comment-style 'multi-line)

;; etags
(global-set-key (kbd "M-,") 'pop-tag-mark)

;; semantic
(semantic-mode 1)
(setq semantic-default-submodes 
      '(global-semantic-idle-scheduler-mode
        global-semanticdb-minor-mode
        global-semantic-idle-local-symbol-highlight-mode
        global-semantic-show-parser-state-mode))
(add-to-list 'semantic-inhibit-functions
	     (lambda ()
	       (cond
		((member major-mode '(python-mode)) t)
		(t nil))))

(require 'hs-settings)

(require 'yasnippet)
(setq yas/root-directory (list (concat emacs-dir "snippets/")))
(setq yas/indent-line 'fixed)
(yas-global-mode 1)
(define-key yas-keymap (kbd "TAB") nil)
(define-key yas-keymap (kbd "<backtab>") nil)
(define-key yas-keymap (kbd "C-n") 'yas-next-field)
(define-key yas-keymap (kbd "C-p") 'yas-prev-field)

(require 'auto-complete-config)
(ac-config-default)

(require 'cc-settings)

(require 'lisp-settings)

(require 'tex-settings)

(require 'org-settings)

(require 'python-settings)

(require 'tc-settings)

(provide 'text-mode-settings)
