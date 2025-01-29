; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)

(defun inorder (tree)
    (cond
        ((null tree) nil)
        ((= (cadr tree) 0) (list (car tree)))
        (t (append (inorder (cddr tree)) (list (car tree)) (inorder (get-right tree))))
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

(defun inorder (tree)
    (cond
        ((null tree) nil)
        (t (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree))))
    )
)
