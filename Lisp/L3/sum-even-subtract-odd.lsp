(defun sum-even-subtract-odd (l)
    (cond
        ((null l) 0)
        ((integerp (car l))
            (cond
                ((evenp (car l)) (+ (car l) (sum-even-subtract-odd (cdr l))))
                (t (- (sum-even-subtract-odd (cdr l)) (car l)))
            )
        )
        ((atom (car l)) (sum-even-subtract-odd (cdr l)))
        (t (+ (sum-even-subtract-odd (car l)) (sum-even-subtract-odd (cdr l))))
    )
)

(defun sum-even-subtract-odd (x)
    (cond
        ((and (numberp x) (evenp x)) x)
        ((numberp x) (* -1 x))
        ((atom x) 0)
        (t (apply #'+ (mapcar #'sum-even-subtract-odd x)))
    )
)