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

(provide 'init-preload-local)
