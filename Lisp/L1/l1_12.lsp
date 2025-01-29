;a) Write a function to return the dot product of two vectors.
(defun dot-product (v1 v2)
    (if (or (null v1) (null v2))
        0
        (+ (* (car v1) (car v2)) (dot-product (cdr v1) (cdr v2)))
    )
)
;b) Write a function to return the maximum value of all the numerical atoms of a list, at any level.
(defun max-value (lst)
    (cond
        ((null lst) 0)
        ((numberp (car lst)) (m-a-x (car lst) (max-value (cdr lst))))
        (t (m-a-x (max-value (car lst)) (max-value (cdr lst))))
    )
)
(defun m-a-x (a b)
    (if (> a b) a b)
)
;d) Write a function to return T if a list has an even number of elements on the first level, and NIL on the contrary case, without counting the elements of the list.
(defun even-number (lst)
    (cond
        ((null lst) t)
        ((null (cdr lst)) nil)
        (t (even-number (cddr lst)))
    )
)