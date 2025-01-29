(defun fct (f l)
    (cond
        ((null l) nil)
        ((funcall f (car l)) (cons (funcall f (car l)) (fct f (cdr l))))
        (t nil)
    )
)

(defun fct (f l)
    (cond
        ((null l) nil)
        ((null (funcall f (car l))) nil)
        (t (cons (funcall f (car l)) (fct f (cdr l))))
    )
)


(defun Fct(F L)
    (cond
        ((null L) nil)
        ((funcall F (car L)) (cons (funcall F (car L)) (Fct F (cdr L))))
        (t nil)
    )
)

(print (Fct #'(lambda (x) (* x x)) '(1 2 3 4)))

(defun Fct2(F L)
    (mapcar (lambda (x) (FUNCALL F x)) L)
)

(defun replace-atoms-on-odd-level (x k e)
    (cond
        ((and (atom x) (oddp k)) e)
        ((atom x) x)
        (t (mapcar #'(lambda (y) (replace-atoms-on-odd-level y (1+ k) e)) x))
    )
)

(defun replace-atoms-on-odd-level-main (x e)
    (replace-atoms-on-odd-level x -1 e)
)