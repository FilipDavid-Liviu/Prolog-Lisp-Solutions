(defun no-atoms-level (l level)
    (cond
        ((null l) 0)
        ((and (atom (car l)) (= level 0)) (1+ (no-atoms-level (cdr l) level)))
        ((atom (car l)) (no-atoms-level (cdr l) level))
        (t (+ (no-atoms-level (car l) (1- level)) (no-atoms-level (cdr l) level)))
    )
)

(defun atoms-on-level (x k)
    (cond
        ((and (atom x) (eql k 0)) 1)
        ((atom x) 0)
        (t (apply #'+ (mapcar #'(lambda (y) (atoms-on-level y (1- k))) x)))
    )
)