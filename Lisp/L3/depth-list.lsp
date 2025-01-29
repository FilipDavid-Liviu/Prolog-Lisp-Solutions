(defun depth-list (l)
    (cond
        ((null l) 1)
        ((atom (car l)) (depth-list (cdr l)))
        (t (max (1+ (depth-list (car l))) (depth-list (cdr l))))
    )
)

(defun compute-depth (x)
    (cond
        ((atom x) 0)
        (t (1+ (apply #'max (mapcar #'compute-depth x))))
    )
)