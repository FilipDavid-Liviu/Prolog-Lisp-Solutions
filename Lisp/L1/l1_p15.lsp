;a) Write a function to insert an element E on the n-th position of a linear list
(defun insert-nth (lst n e)
    (cond
        ((null lst) nil)
        ((= n 1) (cons e lst))
        (t (cons (car lst) (insert-nth (cdr lst) (1- n) e)))
    )
)
;b) Write a function to return the sum of all numerical atoms of a list, at any level.
(defun sum-list (lst)
    (cond
        ((null lst) 0)
        ((numberp (car lst)) (+ (car lst) (sum-list (cdr lst))))
        (t (+ (sum-list (car lst)) (sum-list (cdr lst))))
    )
)
;c) Write a function to return the set of all sublists of a given linear list. Ex. For list  ((1 2 3) ((4 5) 6)) => 
;((1 2 3) (4 5) ((4 5) 6)) 
(defun sublists (lst)
    (cond
        ((null lst) nil)
        (t (append (sublists (cdr lst)) (mapcar (lambda (x) (cons (car lst) x)) (sublists (cdr lst)))))
    )
)
(defun sublists (lst)
    (cond
        ((null lst) '(nil)) ; Base case: The sublist of an empty list is a list containing the empty list
        (t (append (sublists (cdr lst)) ; Sublists excluding the first element
                (add-element-to-sublists (car lst) (sublists (cdr lst))))))) ; Sublists including the first element

(defun add-element-to-sublists (element sublists)
    (cond
        ((null sublists) nil) ; Base case: No sublists to add to
        (t (cons (cons element (car sublists)) ; Add `element` to the first sublist
                (add-element-to-sublists element (cdr sublists)))))) ; Recurse on the rest of the sublists

;d) Write a function to test the equality of two sets, without using the difference of two sets.
(defun equal-sets (set1 set2)
    (cond
        ((null set1) (null set2))
        ((null set2) nil)
        ((member (car set1) set2) (equal-sets (cdr set1) (remove-element-once (car set1) set2)))
        (t nil)
    )
)
(defun remove-element-once (lst e)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) (cdr lst))
        (t (cons (car lst) (remove-element-once (cdr lst) e)))
    )
)
