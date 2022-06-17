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

;(cd "~/data")(shell)(rename-buffer "data")
;(cd "~/data/lee/dev")(shell)(rename-buffer "dev")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;			Basic Customization			    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq debug-on-error nil)

;; enable time-stamping
;(add-hook 'write-file-hooks 'time-stamp)

;;-------------------------------------------------------------------------------
;; sets the load path for lisp files
;; append to load path
;;-------------------------------------------------------------------------------
(setq original-load-path load-path)
(setq load-path
      (append
       (list (expand-file-name "~/.emacs.d/lisp/"))
       original-load-path))

;(setq load-path (cons (expand-file-name "~/.xemacs/lisp") load-path))
;(setq load-path (cons "~/.xemacs/lisp" load-path))

;; set stuff
(line-number-mode 1)
(set-default 'auto-show-mode nil)
(setq blink-matching-paren t)
(setq column-number-mode t)

;; dired-x

;;(setq dired-load-hook '(lambda () (load "dired-x")))

;; Load my stuff

(load "my-keymap" )
(load "prog-utils" )
                                        ;(load "font-lock-customizations-new" )


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

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Key-Binding-Commands.html
(global-set-key [f1] 'save-buffer)
(global-set-key [f2] 'find-file)
(global-set-key [f4] 'electric-buffer-list)
(global-set-key [f6] 'start-kbd-macro)
(global-set-key [f7] 'end-kbd-macro)
(global-set-key [f8] 'call-last-kbd-macro)
(global-set-key [f9] 'compile)
(global-set-key [f10] 'next-error)
(global-set-key [(control f10)] 'previous-error)
;; (global-set-key "\C-x\C-b" 'electric-buffer-list)
;; (global-set-key "\C-x?" 'what-line)
;; (global-set-key "\C-x_" 'goto-line)
                                        ;(define-key global-map [(SunF36)] 'revert-buffer)
                                        ;(define-key global-map [(SunF37)] 'rename-buffer)

(global-set-key [f11] 'revert-buffer)
(global-set-key [(shift f11)] 'shell)
(global-set-key [f12] 'rename-buffer)
(global-set-key [(shift f12)] 'rlogin)
(global-set-key [(shift f3)] 'shell-resync-dirs)

                                        ;(put 'rlogin-directory-tracking-mode 'disabled t)

;;(require 'delbackspace)
(put 'set-goal-column 'disabled nil)

;;-------------------------------------------------------------------------------
;; shell-mode stuff
;;-------------------------------------------------------------------------------
(add-hook 'comint-output-filter-functions
	  'comint-strip-ctrl-m)
                                        ;(add-hook 'shell-mode-hook 'turn-on-font-lock)
;;(setq minibuffer-max-depth nil)
(setq-default indent-tabs-mode t)
(setq truncate-lines nil)
(setq permanent-buffers-mode nil)
(setq zmacs-regions nil)
