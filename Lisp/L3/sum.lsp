(defun sum (l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ (car l) (sum (cdr l))))
        ((atom (car l)) (sum (cdr l)))
        (t (+ (sum (car l)) (sum (cdr l))))
    )
)

(defun sum (x)
    (cond
        ((numberp x) x)
        ((atom x) 0)
        (t (apply #'+ (mapcar #'sum x)))
    )
)