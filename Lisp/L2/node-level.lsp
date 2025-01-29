(defun node-level (tree node)
    (cond
        ((null tree) nil)
        (t (node-level-aux tree node 0))
    )
)

; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)

(defun node-level-aux (tree node current-level)
    (cond
        ((null tree) nil)
        ((equal (car tree) node) current-level)
        ((= (cadr tree) 0) nil)
        (t (or (node-level-aux (cddr tree) node (1+ current-level))
               (node-level-aux (get-right tree) node (1+ current-level))))
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

(defun node-level-aux (tree node current-level)
    (cond
        ((null tree) nil)
        ((equal (car tree) node) current-level)
        (t (or (node-level-aux (cadr tree) node (1+ current-level))
               (node-level-aux (caddr tree) node (1+ current-level))))
    )
)