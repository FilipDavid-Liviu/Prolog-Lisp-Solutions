(defun all-sublists (lst)
    (if (null lst) '(())
        (let ((rest-sublists (all-sublists (cdr lst))))
            (append rest-sublists
                (mapcar (lambda (sublist) (cons (car lst) sublist)) rest-sublists)))
    )
)


(defun all-sublists (x)
    (if (null x) 
        (list nil)
        (append (all-sublists (cdr x)) (mapcar (lambda (sublist) (cons (car x) sublist)) (all-sublists (cdr x))))
    )
)

(defun combinations (k lst)
    (cond
        ((= k 0)
            (list nil))
        ((null lst) nil)
        (t
            (append
                (mapcar (lambda (comb) (cons (car lst) comb))
                        (combinations (- k 1) (cdr lst)))
                (combinations k (cdr lst))))
    )
)
(defun permute-list (lst)
    (cond
        ((null lst) '(()))
        (t
            (apply #'append
                (mapcar (lambda (x)
                    (mapcar (lambda (y) (cons x y))
                            (permute-list (remove x lst))))
                        lst)))
    )
)

(defun arrangements (k lst)
    (apply #'append (mapcar (lambda (comb) (permute-list comb)) (combinations k lst)))
)