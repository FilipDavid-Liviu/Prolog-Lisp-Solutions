; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)

(defun postorder (tree)
    (cond
        ((null tree) nil)
        ((= (cadr tree) 0) (list (car tree)))
        (t (append (postorder (cddr tree)) (postorder (get-right tree)) (list (car tree))))
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

(defun postorder (tree)
    (cond
        ((null tree) nil)
        (t (append (postorder (cadr tree)) (postorder (caddr tree)) (list (car tree))))
    )
)