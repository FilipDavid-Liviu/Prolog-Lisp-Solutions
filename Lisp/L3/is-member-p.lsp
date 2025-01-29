(defun is-member-p (l element)
    (cond
        ((null l) nil)
        ((eq element (car l)) t)
        ((atom (car l)) (is-member-p (cdr l) element))
        (t (or (is-member-p (car l) element) (is-member-p (cdr l) element)))
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

(defun is-member-p (x e)
    (cond
        ((eql x e) t)
        ((atom x) nil)
        (t (reduce (lambda (x y) (or x y)) (mapcar #'(lambda (y) (is-member-p-in y e)) x)))
    )
)