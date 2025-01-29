(defun remove-all (l element)
    (cond
        ((null l) nil)
        ((eq (car l) element) (remove-all (cdr l) element))
        ((atom (car l)) (cons (car l) (remove-all (cdr l) element)))
        (t (cons (remove-all (car l) element) (remove-all (cdr l) element)))
    )
)


(defun remove-all (x element)
    (car (remove-all-in x element))
)
(defun remove-all-in (x element)
    (cond
        ((null x) nil)
        ((equal x element) nil)
        ((atom x) (list x))
        (t (list (apply #'append (mapcar #'(lambda (y) (remove-all-in y element)) x))))
    )
)
(defun remove-all-in (x element)
    (cond
        ((null x) nil)
        ((equal x element) nil)
        ((atom x) (list x))
        (t (list (mapcan #'(lambda (y) (remove-all-in y element)) x)))
    )
)
