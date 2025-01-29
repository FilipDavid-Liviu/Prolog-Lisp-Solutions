(defun nodes-on-level (tree level)
    (cond
        ((null tree) nil)
        (t (nodes-on-level-aux tree level 0))
    )
)

; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)

(defun nodes-on-level-aux (tree level current-level)
    (cond
        ((null tree) nil)
        ((= current-level level) (list (car tree)))
        ((= (cadr tree) 0) nil)
        (t (append (nodes-on-level-aux (cddr tree) level (+ current-level 1))
                (nodes-on-level-aux (get-right tree) level (+ current-level 1)))
        )
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

(defun nodes-on-level-aux (tree level current-level)
    (cond
        ((null tree) nil)
        ((= current-level level) (list (car tree)))
        (t (append (nodes-on-level-aux (cadr tree) level (+ current-level 1))
                (nodes-on-level-aux (caddr tree) level (+ current-level 1)))
        )
    )
)