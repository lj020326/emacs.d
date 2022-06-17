;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

;; ref: https://emacs.stackexchange.com/questions/4253/how-to-start-emacs-with-a-custom-user-emacs-directory
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

;;-------------------------------------------------------------------------------
;; sets the load path for lisp files
;; append to load path
;;-------------------------------------------------------------------------------
;; (setq original-load-path load-path)
;; (setq load-path
;;       (append
;;        (list (expand-file-name "~/.demacs.d/lisp/"))
;;        original-load-path))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;; Bootstrap config


(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH


;; Allow users to provide an optional "init-preload-local.el"
(require 'init-preload-local nil t)

;;; Load configs for specific features and modes
;(require-package 'diminish)
;(maybe-require-package 'scratch)
;(require-package 'command-log-mode)
;
;(require 'init-frame-hooks)
;(require 'init-xterm)
;(require 'init-themes)
;(require 'init-osx-keys)
;(require 'init-gui-frames)
;(require 'init-dired)
;(require 'init-isearch)
;(require 'init-grep)
;(require 'init-uniquify)
;(require 'init-ibuffer)
;;;(require 'init-flymake)
;;;(require 'init-eglot)
;
;(require 'init-recentf)
;;; get following error upon C-x-b when init-minibuffer is active
;;; "Symbol’s function definition is void: projectile-project-root"
;;(require 'init-minibuffer)
;(require 'init-hippie-expand)
;(require 'init-company)
;(require 'init-windows)
;(require 'init-sessions)
;(require 'init-mmm)
;
;(require 'init-editing-utils)
;(require 'init-whitespace)
;
;(require 'init-vc)
;(require 'init-darcs)
;(require 'init-git)
;(require 'init-github)
;
;(require 'init-projectile)
;
;(require 'init-compile)
;(require 'init-crontab)
;(require 'init-textile)
;(require 'init-markdown)
;(require 'init-csv)
;(require 'init-erlang)
;(require 'init-javascript)
;(require 'init-php)
;(require 'init-org)
;(require 'init-nxml)
;(require 'init-html)
;(require 'init-css)
;(require 'init-haml)
;(require 'init-http)
;(require 'init-python)
;(require 'init-haskell)
;(require 'init-elm)
;(require 'init-purescript)
;(require 'init-ruby)
;(require 'init-rails)
;(require 'init-sql)
;(require 'init-ocaml)
;(require 'init-j)
;(require 'init-nim)
;(require 'init-rust)
;(require 'init-toml)
;(require 'init-yaml)
;(require 'init-docker)
;(require 'init-terraform)
;(require 'init-nix)
;(maybe-require-package 'nginx-mode)
;
;(require 'init-paredit)
;(require 'init-lisp)
;(require 'init-slime)
;(require 'init-clojure)
;(require 'init-clojure-cider)
;(require 'init-common-lisp)
;
;(when *spell-check-support-enabled*
;  (require 'init-spelling))
;
;(require 'init-misc)
;
;(require 'init-folding)
;(require 'init-dash)
;
;;;(require 'init-twitter)
;;; (require 'init-mu)
;(require 'init-ledger)
;;; Extra packages which don't require any configuration
;
;(require-package 'sudo-edit)
;(require-package 'gnuplot)
;(require-package 'lua-mode)
;(require-package 'htmlize)
;(when *is-a-mac*
;  (require-package 'osx-location))
;(maybe-require-package 'dotenv-mode)
;(maybe-require-package 'shfmt)
;
;(when (maybe-require-package 'uptimes)
;  (setq-default uptimes-keep-count 200)
;  (add-hook 'after-init-hook (lambda () (require 'uptimes))))
;
;(when (fboundp 'global-eldoc-mode)
;  (add-hook 'after-init-hook 'global-eldoc-mode))
;
;(require 'init-direnv)
;
;
;
;;; Allow access from emacsclient
;(add-hook 'after-init-hook
;          (lambda ()
;            (require 'server)
;            (unless (server-running-p)
;              (server-start))))
;
;;; Variables configured via the interactive 'customize' interface
;(when (file-exists-p custom-file)
;  (load custom-file))
;
;;; Locales (setting them earlier in this file doesn't work in X)
;(require 'init-locales)
;
;;; Allow users to provide an optional "init-local" containing personal settings
;(require 'init-local nil t)
;
;(provide 'init)
;
;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t
;;; End:
;;;; init.el ends here
;


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
(require 'init-desktop)
(desktop-load-default)
(desktop-read)

;(setq desktop-enable nil)
;(setq desktop-missing-file-warning nil)
(setq permanent-buffers-mode nil)
(setq truncate-lines nil)
;(setq zmacs-regions nil)
(setq desktop-path (cons (expand-file-name "~/.demacs.d/") load-path))

(defun my-desktop-save ()
 "when exiting, save the desktop first."
 (if desktop-dirname
	  (desktop-save desktop-dirname)))

(add-hook 'kill-emacs-hook 'my-desktop-save)
