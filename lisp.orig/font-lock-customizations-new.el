;;
;;
;; Now, the function that sets up my fonts....
;;
;;

(defun font-lock-initialize ()
  "Set the font-lock fonts and colors"
  (interactive)

  (require 'font-lock)

  (setq font-lock-background-mode 'dark)

;  (setq font-lock-face-attributes 
;	'((font-lock-comment-face "wheat")
;	  (font-lock-string-face "Green")
;	  (font-lock-keyword-face "hotpink2")
;	  (font-lock-function-name-face "yellow")
;	  (font-lock-variable-name-face "white")
;	  (font-lock-type-face "seagreen2")
;	  (font-lock-emphasized-face "coral")
;	  (font-lock-other-emphasized-face "coral")
;	  (font-lock-type-face "seagreen2")
;	  (font-lock-reference-face "white")))

  (setq font-lock-face-attributes 
	'((font-lock-comment-face "PaleGreen")
	  (font-lock-string-face "Thistle")
	  (font-lock-keyword-face "Coral")
	  (font-lock-function-name-face "Khaki")
	  (font-lock-variable-name-face "MediumSpringGreen")
	  (font-lock-type-face "Orchid")
	  (font-lock-emphasized-face "Goldenrod")
	  (font-lock-other-emphasized-face "Magenta")
	  (font-lock-other-type-face "SteelBlue")
	  (font-lock-reference-face "CadetBlue")))

;  (set-foreground-color "MediumAquamarine")
;  (set-background-color "Black")
;  (set-default-font
;   "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1")

;  ;; the documentation face
;  (if (internal-find-face 'font-lock-doc-string-face)
;      (progn
;      (set-face-foreground 'font-lock-doc-string-face "cyan")
;      (set-face-background 'font-lock-doc-string-face "black")
;      ))

  ;; set up lisp and c modes a little better
  (setq lisp-font-lock-keywords lisp-font-lock-keywords-2)
  (setq c-font-lock-keywords c-font-lock-keywords-2)

;  (set-face-foreground 'default "coral")
;  (set-face-background 'default "black")
;  (set-face-foreground 'highlight "hotpink")
;  (set-face-background 'highlight "black")

;(set-face-foreground 'isearch "black")

;; How about mixing up the font colors for hyper-apropos
(setq hyper-apropos-mode-hook '(lambda () 
				 (set-face-foreground 'documentation "red")
				 (set-face-foreground 'hyperlink "yellow")
				 (make-face-bold 'documentation)
				 (make-face-bold 'hyperlink)
				 ))

;; Set up fonts for ps-print
;(require 'ps-print)
;(setq ps-bold-faces (cons 'font-lock-string-face ps-bold-faces ))
;(setq ps-bold-faces (cons 'font-lock-doc-string-face ps-bold-faces ))
;(setq ps-bold-faces (cons 'font-lock-function-name-face ps-bold-faces ))
;(setq ps-bold-faces (cons 'font-lock-keyword-face ps-bold-faces ))

;(setq ps-italic-faces (cons 'font-lock-string-face ps-italic-faces ))
;(setq ps-italic-faces (cons 'font-lock-doc-string-face ps-italic-faces ))
;(setq ps-italic-faces (cons 'font-lock-comment-face ps-italic-faces ))

;; set up mode hooks
(add-hook 'elisp-mode-hook 'turn-on-font-lock)
(add-hook 'c-mode-common-hook 'turn-on-font-lock)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'perl-mode-hook 'turn-on-font-lock)
(add-hook 'cperl-mode-hook 'turn-on-font-lock)
(add-hook 'makefile-mode-hook 'turn-on-font-lock)
; new additions - ljj
;(add-hook 'shell-mode-hook      'turn-on-font-lock)
(add-hook 'java-mode-hook       'turn-on-font-lock)
(add-hook 'c++-mode-hook        'turn-on-font-lock)
(add-hook 'dired-mode-hook      'turn-on-font-lock)
;;  (add-hook 'info-mode-hook 'turn-on-font-lock)
  (setq info-fontify t)
)
