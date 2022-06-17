

;;-------------------------------------------------------------------------------
;; sets the load path for lisp files
;; append to load path
;;-------------------------------------------------------------------------------

;; set stuff
(setq line-number-mode 1)
(setq auto-show-mode nil)
(setq blink-matching-paren t)
(setq column-number-mode t)
(setq inhibit-startup-message t )

;; Change the values of some variables.
;; (t means true; nil means false.)
;;
;; Use the "Describe Variable..." option on the "Help" menu
;; to find out what these variables mean.
(setq find-file-use-truenames nil
      find-file-compare-truenames t
      minibuffer-confirm-incomplete t
      complex-buffers-menu-p t
      next-line-add-newlines nil
      mail-yank-prefix "> "
      kill-whole-line t
      )

;; dired-x

;;(setq dired-load-hook '(lambda () (load "dired-x")))

;;-------------------------------------------------------------------------------
;; Loads lisp/desktop.el
;; Always use Meta-X desktop-save when exiting xemacs to save your settings
;;-------------------------------------------------------------------------------
                                        ;(load "desktop")
(require 'init-keymap)
(desktop-read)

;(setq desktop-enable nil)
;(setq desktop-missing-file-warning nil)
(setq permanent-buffers-mode nil)
(setq truncate-lines nil)
;(setq zmacs-regions nil)

;; performed in init-session.el
;(desktop-save-mode 1)
(setq desktop-path (cons (expand-file-name "~/.demacs.d/") load-path))

(defun desktop-release-lock (&optional dirname)
  "Remove the lock file for the desktop in DIRNAME.
DIRNAME omitted or nil means use `desktop-dirname'."
  (let ((file (desktop-full-lock-name dirname)))
    (when (file-exists-p file) (delete-file file))))

;(add-hook 'kill-emacs-hook 'desktop-release-lock)
(add-hook 'kill-emacs-hook 'desktop-release-lock 'desktop-path)

(provide 'init-local)
