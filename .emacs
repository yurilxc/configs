;; add emacs-dir recusively to load-path
(setq emacs-dir (expand-file-name "~/.emacs.d/"))
(let* ((default-directory emacs-dir)
       (orig-load-path load-path))
  (setq load-path (cons emacs-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

(require 'apperance)

(require 'global-settings)

(require 'tools)

(require 'programming)
