; ntree -> '(A (B (D) (E (G))) (I (K)) (C (F (H))))

(defun is-member-ntree-p (tree node)
    (cond
        ((null tree) nil)
        ((eq (car tree) node) t)
        ((atom (car tree)) (is-member-ntree-p (cdr tree) node))
        (t (or (is-member-ntree-p (car tree) node) (is-member-ntree-p (cdr tree) node)))
    )
)

(defun is-member-p-in (x e)
    (cond
        ((eql x e) 0)
        ((atom x) 1)
        (t (apply #'* (mapcar #'(lambda (y) (is-member-p-in y e)) x)))
    )
)

(defun is-member-p (x e)
    (if (eql 0 (is-member-p-in x e))
        t
        nil
    )
)