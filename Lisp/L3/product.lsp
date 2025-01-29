(defun product (l)
    (cond
        ((null l) 1)
        ((numberp (car l)) (* (car l) (product (cdr l))))
        ((atom (car l)) (product (cdr l)))
        (t (* (product (car l)) (product (cdr l))))
    )
)

(defun product (x)
    (cond
        ((numberp x) x)
        ((atom x) 1)
        (t (apply #'* (mapcar #'product x)))
    )
)