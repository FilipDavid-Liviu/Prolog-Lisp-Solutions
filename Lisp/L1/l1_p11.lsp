;a) Determine the least common multiple of the numerical values of a nonlinear list.
(defun g-c-d (a b)
    (cond
        ((= b 0) a)
        (t (g-c-d b (mod a b)))
    )
)
(defun l-c-m (a b)
    (cond
        ((= a 0) 0)
        ((= b 0) 0)
        (t (/ (* a b) (gcd a b)))
    )
)
(defun lcm-list (lst)
    (cond
        ((null lst) 1)
        ((numberp (car lst)) (lcm (car lst) (lcm-list (cdr lst))))
        (t (lcm (lcm-list (car lst)) (lcm-list (cdr lst))))
    )
)
;b) Write a function to test if a linear list of numbers has a "mountain" aspect (a list has a "mountain" aspect if the items increase to a certain point and then decreases.
;you see, we need recursion to solve this problem
(defun mountain (lst)
    (cond
        ((null lst) nil)
        ((null (cdr lst)) nil)
        ((null (cddr lst)) nil)
        (t (mountain-flag lst -1))
    )
)
(defun mountain-flag (lst flag)
    (cond
        ((null lst) t)
        ((null (cdr lst)) t)
        ((= flag -1) (if (<= (car lst) (cadr lst)) (mountain-flag (cdr lst) 0) nil))
        ((= flag 0) (if (<= (car lst) (cadr lst)) (mountain-flag (cdr lst) 0) (mountain-flag (cdr lst) 1)))
        (t (if (<= (car lst) (cadr lst)) nil (mountain-flag (cdr lst) 1)))
    )
)
;c) Remove all occurrences of a maximum numerical element from a nonlinear list.
(defun remove-max (lst)
    (remove-element lst (max-list lst))
)
(defun remove-element (lst e)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) (remove-element (cdr lst) e))
        ((atom (car lst)) (cons (car lst) (remove-element (cdr lst) e)))
        (t (cons (remove-element (car lst) e) (remove-element (cdr lst) e)))
    )
)
(defun max-list (lst)
    (cond
        ((null lst) 0)
        ((numberp (car lst)) (m-a-x (car lst) (max-list (cdr lst))))
        (t (m-a-x (max-list (car lst)) (max-list (cdr lst))))
    )
)
(defun m-a-x (a b)
    (if (> a b) a b)
)

;d) Write a function which returns the product of numerical even atoms from a list, to any level.
(defun product-even (lst)
    (cond
        ((null lst) 1)
        ((numberp (car lst)) (if (evenp (car lst)) (* (car lst) (product-even (cdr lst))) (product-even (cdr lst))))
        (t (* (product-even (car lst)) (product-even (cdr lst))))
    )
)