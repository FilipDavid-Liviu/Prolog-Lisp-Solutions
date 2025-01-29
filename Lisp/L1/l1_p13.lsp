;a) A linear list is given. Eliminate from the list all elements from N to N steps, N-given.
(defun eliminate-n-to-n (lst n)
    (cond
        ((null lst) nil)
        (t (eliminate-n-to-n-inner lst n n))
    )
)
(defun eliminate-n-to-n-inner (lst index times)
    (cond
        ((null lst) nil)
        ((= times 0) lst)
        ((= index 1) (eliminate-n-to-n-inner (cdr lst) 1 (1- times)))
        (t (cons (car lst) (eliminate-n-to-n-inner (cdr lst) (1- index) times)))
    )
)
;b)  Write  a function to test  if a  linear  list of  integer  numbers has  a "valley" aspect (a list  has a valley 
;aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must have 
;at least 3 elements to fullfill this condition.
(defun valley (lst)
    (cond
        ((null lst) nil)
        ((null (cdr lst)) nil)
        ((null (cddr lst)) nil)
        (t (valley-flag lst -1))
    )
)
(defun valley-flag (lst flag)
    (cond
        ((null lst) t)
        ((null (cdr lst)) t)
        ((= flag -1) (if (>= (car lst) (cadr lst)) (valley-flag (cdr lst) 0) nil))
        ((= flag 0) (if (>= (car lst) (cadr lst)) (valley-flag (cdr lst) 0) (valley-flag (cdr lst) 1)))
        (t (if (>= (car lst) (cadr lst)) nil (valley-flag (cdr lst) 1)))
    )
)
;c) Build a function that returns the minimum numeric atom from a list, at any level.
(defun min-list (lst)
    (cond
        ((null lst) 0)
        ((numberp (car lst)) (m-i-n (car lst) (min-list (cdr lst))))
        (t (m-i-n (min-list (car lst)) (min-list (cdr lst))))
    )
)
(defun m-i-n (a b)
    (if (< a b) a b)
)
;d) Write a function that deletes from a linear list of all occurrences of the maximum element.
(defun remove-max (lst)
    (remove-element lst (max-list lst))
)
(defun remove-element (lst e)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) (remove-element (cdr lst) e))
        (t (cons (car lst) (remove-element (cdr lst) e)))
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