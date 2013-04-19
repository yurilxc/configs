(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(list (ibuffer)
      (add-to-list 'ibuffer-never-show-predicates "\*w3m\*.*")
      (add-to-list 'ibuffer-never-show-predicates "*-jabber-roster-*"))

(require 'desktop)
(desktop-save-mode 1)
(setq desktop-save t
      desktop-globals-to-save
      '(file-name-history
	extended-command-history
	grep-history
	minibuffer-history
	query-replace-history
	read-expression-history
	regexp-history
	search-history
	search-ring
	shell-command-history
	kill-ring))
;; (setq desktop-globals-to-clear nil)

;; dict
(global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (current-word nil t)))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                            nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        (unless (null (cdr (window-list))) ; only one window
                                          (set-window-configuration kid-sdcv-window-configuration)))))
           (goto-char (point-min))))))))


;; TODO
;; Useless in Terminal mode
;; ;; ibus
;; (add-to-list 'load-path (concat emacs-site-lisp-prefix "ibus/"))
;; (require 'ibus)
;; (progn
;;   (customize-set-variable 'ibus-python-shell-command-name "python2")
;;   (add-hook 'after-init-hook 'ibus-mode-on))

(provide 'tools)
