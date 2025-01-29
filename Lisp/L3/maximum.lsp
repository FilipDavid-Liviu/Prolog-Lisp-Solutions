(defun maximum (l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (max-f (car l) (maximum (cdr l))))
        ((atom (car l)) (maximum (cdr l)))
        (t (max-f (maximum (car l)) (maximum (cdr l))))
    )
)

(defun max-f (a b)
    (cond
        ((null a) b)
        ((null b) a)
        ((> a b) a)
        (t b)
    )
)

(defun max-all (&rest args)
    (cond
        ((null args) nil)
        ((null (cdr args)) (car args))
        (t (max-f (car args) (apply #'max-all (cdr args))))
    )
)

(defun maximum (x)
    (cond
        ((numberp x) x)
        ((atom x) nil)
        (t (apply #'max-all (mapcar #'maximum x)))
    )
)