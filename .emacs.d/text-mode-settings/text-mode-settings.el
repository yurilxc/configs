;; hs-mode
;; TODO non-terminal
;; (global-set-key (kbd "C-?") 'hs-toggle-hiding)
;; (global-set-key (kbd "C-=") 'hs-show-block)
;; (global-set-key (kbd "C-+") 'hs-show-all)
;; (global-set-key (kbd "C--") 'hs-hide-block)
;; (global-set-key (kbd "C-_") 'hs-hide-all)))
(global-set-key (kbd "ESC [ 5") 'hs-show-block)
(global-set-key (kbd "ESC [ 6") 'hs-show-all)
(global-set-key (kbd "ESC [ 3") 'hs-hide-block)
(global-set-key (kbd "ESC [ 4") 'hs-hide-all)

(require 'yasnippet)
(setq yas/root-directory (list (concat emacs-dir "snippets/")))
(setq yas/indent-line 'fixed)
(yas-global-mode)

(require 'auto-complete-config)
(ac-config-default)

(require 'cc-settings)

(require 'lisp-settings)

(require 'tex-settings)

(require 'org-settings)

(require 'python-settings)

(require 'tc-settings)

(provide 'text-mode-settings)
