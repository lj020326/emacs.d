;; -*- Mode: Emacs-Lisp -*-

;; Time-stamp: <2022-02-16 20:22:59 ljohnson>

;;;
;;; emacs init file
;;;

;; This is a sample .emacs file.
;;
;; The .emacs file, which should reside in your home directory, allows you to
;; customize the behavior of Emacs.  In general, changes to your .emacs file
;; will not take effect until the next time you start up Emacs.  You can load
;; it explicitly with `M-x load-file RET ~/.emacs RET'.
;;
;; There is a great deal of documentation on customization in the Emacs
;; manual.  You can read this manual with the online Info browser: type
;; `C-h i' or select "Emacs Info" from the "Help" menu.

;; ref: https://emacs.stackexchange.com/questions/4253/how-to-start-emacs-with-a-custom-user-emacs-directory
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;			Basic Customization			    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(cd "~/data")(shell)(rename-buffer "data")
;(cd "~/data/lee/dev")(shell)(rename-buffer "dev")

(setq debug-on-error nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;;;;;;;;;;;;; original settings
;; enable time-stamping
;(add-hook 'write-file-hooks 'time-stamp)

;;-------------------------------------------------------------------------------
;; sets the load path for lisp files
;; append to load path
;;-------------------------------------------------------------------------------
(setq original-load-path load-path)
(setq load-path
      (append
       (list (expand-file-name "~/.demacs.d/lisp/"))
       original-load-path))

;(setq load-path (cons (expand-file-name "~/.xemacs/lisp") load-path))
;(setq load-path (cons "~/.xemacs/lisp" load-path))

;;disable splash screen and startup message
;; ref: https://linux-tips.com/t/disabling-emacs-splash-screen/211
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;; set stuff
(setq line-number-mode 1)
;(set-default 'auto-show-mode nil)
(setq auto-show-mode nil)
(setq blink-matching-paren t)
(setq column-number-mode t)

;; dired-x

;;(setq dired-load-hook '(lambda () (load "dired-x")))

;; Load my stuff

;(load "my-keymap" )
;(load "prog-utils" )
;(load "font-lock-customizations-new" )

;;-------------------------------------------------------------------------------
;; Loads lisp/desktop.el
;; Always use Meta-X desktop-save when exiting xemacs to save your settings
;;-------------------------------------------------------------------------------
(load "desktop")
(desktop-load-default)
(desktop-read)

(setq desktop-enable nil)
(setq desktop-missing-file-warning nil)
(setq permanent-buffers-mode nil)
(setq truncate-lines nil)
;(setq zmacs-regions nil)
                                        ;(setq desktop-path (cons (expand-file-name "~/.emacs.d/") load-path))
(setq desktop-path (cons (expand-file-name "~/") load-path))

(defun my-desktop-save ()
  "when exiting, save the desktop first."
  (if desktop-dirname
      (desktop-save desktop-dirname)))
(add-hook 'kill-emacs-hook 'my-desktop-save)
