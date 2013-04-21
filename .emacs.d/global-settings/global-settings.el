;; key binding
(require 'cc-mode)
(global-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
(global-set-key (kbd "C-c DEL") 'c-hungry-delete-backwards)

(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-r") 'replace-string)

;; TODO
;; non-terminal-version
;; (global-set-key (kbd "<C-tab>") 'other-window)
;; (global-set-key (kbd "<C-S-iso-lefttab>") 'previous-multiframe-window)
;; (global-set-key (kbd "<C-S-right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "<C-S-left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "<C-S-up>") 'enlarge-window)
;; (global-set-key (kbd "<C-S-down>") 'shrink-window)
;; terminal-version
(global-set-key (kbd "M-[ 2") 'other-window)
(global-set-key (kbd "<backtab>") 'previous-multiframe-window)
(global-set-key (kbd "M-[ 9") 'enlarge-window-horizontally)
(global-set-key (kbd "M-[ 10") 'shrink-window-horizontally)
(global-set-key (kbd "M-[ 11") 'enlarge-window)
(global-set-key (kbd "M-[ 12") 'shrink-window)

;; winner undo
(winner-mode 1)
(global-set-key (kbd "C-c o") 'winner-undo)
(global-set-key (kbd "C-c p") 'winner-redo)

;; use C-. and C-, to jump to point
;; TODO
;; non-terminal-version
;; (global-set-key (kbd "C-.") 'ska-point-to-register)
;; (global-set-key (kbd "C-,") 'ska-jump-to-register)
(global-set-key (kbd "M-[ 7") 'point-to-register)
(global-set-key (kbd "M-[ 8") 'jump-to-register)

;; backup directory
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/.backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 16
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; clicpboard
(setq x-select-enable-clipboard t)
(unless window-system
  (when (getenv "DISPLAY")
    ;; Callback for when user cuts
    (defun xsel-cut-function (text &optional push)
      ;; Insert text to temp-buffer, and "send" content to xsel stdin
      (with-temp-buffer
	(insert text)
	;; I prefer using the "clipboard" selection (the one the
	;; typically is used by c-c/c-v) before the primary selection
	;; (that uses mouse-select/middle-button-click)
	(call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
    ;; Call back for when user pastes
    (defun xsel-paste-function()
      ;; Find out what is current selection by xsel. If it is different
      ;; from the top of the kill-ring (car kill-ring), then return
      ;; it. Else, nil is returned, so whatever is in the top of the
      ;; kill-ring will be used.
      (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
	(unless (string= (car kill-ring) xsel-output)
	  xsel-output )))
    ;; Attach callbacks to hooks
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)))

(setq scroll-step 1)

(show-paren-mode t)

(setq tab-always-indent 'complete)
;; (setq-default tab-width 4)

(setq kill-ring-max 150)
(setq kill-do-not-save-duplicates t)

(provide 'global-settings)
