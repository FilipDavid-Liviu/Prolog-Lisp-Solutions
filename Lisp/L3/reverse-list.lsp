(defun reverse-list (l)
    (cond 
        ((null l) nil)
        ((atom (car l)) (append (reverse-list (cdr l)) (list (car l))))
        (t (append (reverse-list (cdr l)) (list (reverse-list (car l)))))
    )
)

(defun reverse-list (x)
    (car (reverse-list-in x))
)

(defun reverse-list-in (x)
    (cond
        ((atom x) (list x))
        (t (list (apply #'append (mapcar #'reverse-list-in x))))
    )
)

(defun reverse-list (x)
    (cond
        ((atom x) x)
        (t (reverse (mapcar #'reverse-list x)))
    )
)