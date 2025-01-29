; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)
; type 2 -> '(A (B (D) (E (G))) (C (F (H))))
(defun convert-type-1-to-2 (tree)
    (cond
        ((null tree) nil)
        ((= (cadr tree) 0) (list (car tree)))
        ((= (cadr tree) 1) (append (list (car tree)) (list (convert-type-1-to-2 (cddr tree)))))
        (t (append (list (car tree)) (list (convert-type-1-to-2 (cddr tree))) (list (convert-type-1-to-2 (get-right tree)))))
    )
)

(defun get-right (tree)
    (cond
        ((null tree) nil)
        ((= (cadr tree) 1) nil)
        (t (get-right-aux (cddr tree) (cadr tree)))
    )
)

(defun get-right-aux (tree branches)
    (cond
        ((or (null tree) (= branches 0)) nil)
        ((= branches 1) tree)
        (t (get-right-aux (cddr tree) (- (+ branches (cadr tree)) 1)))
    )
)

; type 2 -> '(A (B (D) (E (G))) (C (F (H))))
; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)

(defun convert-type-2-to-1 (tree)
    (cond
        ((null tree) nil)
        (t (append (list (car tree)) (list (no-branches tree)) (convert-type-2-to-1 (cadr tree)) (convert-type-2-to-1 (caddr tree))))
    )
)

(defun no-branches (tree)
    (cond
        ((null tree) -1)
        (t (1+ (no-branches (cdr tree))))
    )
)