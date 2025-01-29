(defun substitute-element (l element new-element)
    (cond
        ((null l) nil)
        ((eq element (car l)) (cons new-element (substitute-element (cdr l) element new-element)))
        ((atom (car l)) (cons (car l) (substitute-element (cdr l) element new-element)))
        (t (cons (substitute-element (car l) element new-element) (substitute-element (cdr l) element new-element)))
    )
)




(defun substitute-element (x element new-element)
    (cond
        ((equal x element) new-element)
        ((atom x) x)
        (t (mapcar #'(lambda (y) (substitute-element y element new-element)) x))
    )
)