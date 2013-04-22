(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
		  (lambda ()
			(let ((map python-mode-map))
			  (setq python-indent-offset 4)
			  (setq tab-width 4)
			  (add-to-list 'ac-sources 'ac-source-ropemacs))))

(setq ropemacs-enable-autoimport t)

(provide 'python-settings)
