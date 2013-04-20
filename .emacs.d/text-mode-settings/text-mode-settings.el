(require 'yasnippet)
(setq yas/root-directory (list (concat emacs-dir "snippets/")))
(yas-global-mode)

(require 'auto-complete-config)
(ac-config-default)

(require 'lisp-settings)

(require 'tex-settings)

(require 'org-settings)

(require 'python-settings)

(require 'tc-settings)

(provide 'text-mode-settings)
