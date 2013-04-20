(add-hook 'python-mode-hook
		  (lambda ()
			(let ((map python-mode-map))
			  (setq python-indent-offset 4)
			  (setq tab-width 4))))

(provide 'python-settings)
