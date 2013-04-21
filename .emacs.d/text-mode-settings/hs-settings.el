;; hs-mode
;; TODO non-terminal
;; (global-set-key (kbd "C-?") 'hs-toggle-hiding)
;; (global-set-key (kbd "C-=") 'hs-show-block)
;; (global-set-key (kbd "C-+") 'hs-show-all)
;; (global-set-key (kbd "C--") 'hs-hide-block)
;; (global-set-key (kbd "C-_") 'hs-hide-all)))
;; (define-globalized-minor-mode global-hs-minor-mode hs-minor-mode hs-minor-mode)
;; (global-hs-minor-mode 1)
(dolist (hook (list 'c++-mode-hook
		    'lisp-interaction-mode-hook
		    'emacs-lisp-mode-hook
		    'java-mode-hook
		    'python-mode-hook))
  (add-hook hook 'hs-minor-mode))
(global-set-key (kbd "ESC [ 5") 'hs-show-block)
(global-set-key (kbd "ESC [ 6") 'hs-show-all)
(global-set-key (kbd "ESC [ 3") 'hs-hide-block)
(global-set-key (kbd "ESC [ 4") 'hs-hide-all)

(provide 'hs-settings)
