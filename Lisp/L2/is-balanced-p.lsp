; type 2 -> '(A (B (D) (E (G))) (C (F (H))))

(defun is-balanced-p (tree)
    (cond
        ((null tree) t)
        (t (let ((left-depth (depth-tree (cadr tree)))
                 (right-depth (depth-tree (caddr tree))))
            (if (<= (abs (- left-depth right-depth)) 1)
                (and (is-balanced-p (cadr tree)) (is-balanced-p (caddr tree)))
                nil)
            )
        )
    )
)

(defun depth-tree (tree)
    (cond
        ((null tree) 0)
        (t (1+ (max (depth-tree (cadr tree)) 
                    (depth-tree (caddr tree)))))
    )
)