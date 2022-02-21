(defun my-key-definitions ()
  "Some Key Sequence Definitions for some keyboards."

    (define-key function-key-map "\e[A" [up])
    (define-key function-key-map "\e[B" [down])
    (define-key function-key-map "\e[C" [right])
    (define-key function-key-map "\e[D" [left])

    (define-key function-key-map "\e[11~" [f1])
    (define-key function-key-map "\e[12~" [f2])
    (define-key function-key-map "\e[13~" [f3])
    (define-key function-key-map "\e[14~" [f4])
    (define-key function-key-map "\e[15~" [f5])

    (define-key function-key-map "\e[17~" [f6])
    (define-key function-key-map "\e[18~" [f7])
    (define-key function-key-map "\e[19~" [f8])
    (define-key function-key-map "\e[20~" [f9])
    (define-key function-key-map "\e[21~" [f10])

    (define-key function-key-map "\e[23~" [f11])
    (define-key function-key-map "\e[24~" [f12])
    (define-key function-key-map "\e[25~" [f13])
    (define-key function-key-map "\e[26~" [f14])

    (define-key function-key-map "\e[28~" [help])
    (define-key function-key-map "\e[29~" [menu])

    (define-key function-key-map "\e[31~" [f17])
    (define-key function-key-map "\e[32~" [f18])
    (define-key function-key-map "\e[33~" [f19])
    (define-key function-key-map "\e[34~" [f20])

    (define-key function-key-map "\e[1~" [find])
    (define-key function-key-map "\e[2~" [insert])
    (define-key function-key-map "\e[3~" [remove])
    (define-key function-key-map "\e[4~" [select])
    (define-key function-key-map "\e[5~" [prev])
    (define-key function-key-map "\e[6~" [next])

    ;; for alpha keyboard

    (define-key function-key-map "\e[1z" [find])
    (define-key function-key-map "\e[2z" [insert])
    (define-key function-key-map "\e[3z" [remove])
    (define-key function-key-map "\e[4z" [select])
    (define-key function-key-map "\e[5z" [prev])
    (define-key function-key-map "\e[6z" [next])


    (define-key function-key-map "\e[192z" [f11])
    (define-key function-key-map "\e[193z" [f12])
    (define-key function-key-map "\e[194z" [f13])
    (define-key function-key-map "\e[195z" [f14])

    (define-key function-key-map "\e[196z" [help])
    (define-key function-key-map "\e[197z" [menu])

    (define-key function-key-map "\e[198z" [f17])
    (define-key function-key-map "\e[199z" [f18])
    (define-key function-key-map "\e[200z" [f19])
    (define-key function-key-map "\e[201z" [f20])

    ;; Sun left hand keypad 
    ;;(define-key function-key-map "\e[192z"  ) ; Stop  (L1)
    ;;(define-key function-key-map "\e[193z"  ) ; Again (L2)
    ;;(define-key function-key-map "\e[194z"  ) ; Props (L3)
    ;;(define-key function-key-map "\e[195z"  ) ; Undo  (L4)
    ;;(define-key function-key-map "\e[196z"  ) ; Front (L5)
    ;;(define-key function-key-map "\e[197z"  ) ; Copy  (L6)
    ;;(define-key function-key-map "\e[198z"  ) ; Open  (L7)
    ;;(define-key function-key-map "\e[199z"  ) ; Paste (L8)
    ;;(define-key function-key-map "\e[200z"  ) ; Find  (L9)
    ;;(define-key function-key-map "\e[201z"  ) ; Cut   (L10)
    ;;(define-key function-key-map "\e[202z"  ) ; Help
                                           ; (skd see xterm.VT100.Translations)
    ;; Sun F1 - F12

    (define-key function-key-map "\e[224z" [f1])
    (define-key function-key-map "\e[225z" [f2])
    (define-key function-key-map "\e[226z" [f3])
    (define-key function-key-map "\e[227z" [f4])
    (define-key function-key-map "\e[228z" [f5])
    (define-key function-key-map "\e[229z" [f6])
    (define-key function-key-map "\e[230z" [f7])
    (define-key function-key-map "\e[231z" [f8])
    (define-key function-key-map "\e[232z" [f9])
    (define-key function-key-map "\e[233z" [f10])
    (define-key function-key-map "\e[236z" [f11])
    (define-key function-key-map "\e[237z" [f12])

    ;; Sun Keypad

    (define-key function-key-map "\e[220z" [kp-1]) ; KP End  1
    (define-key function-key-map "\e[222z" [kp-3])	; KP PgDn 3
    (define-key function-key-map "\e[218z" [kp-5])	; KP 5
    (define-key function-key-map "\e[214z" [kp-7])	; KP Home 7
    (define-key function-key-map "\e[216z" [kp-9])	; KP PgUp 9
    (define-key function-key-map "\e[211z" [kp-equal]) ; KP =
    (define-key function-key-map "\e[212z" [kp-divide]) ; KP /
    (define-key function-key-map "\e[213z" [kp-multiply]) ; KP *
    (define-key function-key-map "\e[2z"   [kp-0])     ; KP 0

;; SS3 sequences - those that start with "\eO".

    (define-key function-key-map "\eOA" [up]) ; up-arrow
    (define-key function-key-map "\eOB" [down]) ; down-arrow
    (define-key function-key-map "\eOC" [right]) ; right-arrow
    (define-key function-key-map "\eOD" [left]) ; left-arrow
    (define-key function-key-map "\eOM" [kp-enter]) ; Enter
    (define-key function-key-map "\eOP" [kp-f1]) ; PF1  
    (define-key function-key-map "\eOQ" [kp-f2]) ; PF2  
    (define-key function-key-map "\eOR" [kp-f3]) ; PF3  
    (define-key function-key-map "\eOS" [kp-f4]) ; PF4  
    (define-key function-key-map "\eOp" [kp-0]) ; 0
    (define-key function-key-map "\eOq" [kp-1]) ; 1
    (define-key function-key-map "\eOr" [kp-2]) ; 2
    (define-key function-key-map "\eOs" [kp-3]) ; 3
    (define-key function-key-map "\eOt" [kp-4]) ; 4
    (define-key function-key-map "\eOu" [kp-5]) ; 5
    (define-key function-key-map "\eOv" [kp-6]) ; 6
    (define-key function-key-map "\eOw" [kp-7]) ; 7
    (define-key function-key-map "\eOx" [kp-8]) ; 8
    (define-key function-key-map "\eOy" [kp-9]) ; 9
    (define-key function-key-map "\eOl" [kp-separator]) ; ,
    (define-key function-key-map "\eOm" [kp-subtract]) ; -
    (define-key function-key-map "\eOn" [kp-period])	; .
)

(add-hook 'term-setup-hook 'my-key-definitions)
