(defun linear (l)
    (cond 
        ((null l) nil)
        ((atom (car l)) (cons (car l) (linear (cdr l))))
        (t (append (linear (car l)) (linear (cdr l))))
    )
)

(defun flatten (x)
    (cond
        ((atom x) (list x))
        (t (apply #'append (mapcar #'flatten x)))
    )
)
(defun flatten (x)
    (cond
        ((atom x) (list x))
        (t (mapcan #'flatten x))
    )
)