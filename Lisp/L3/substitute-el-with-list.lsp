(defun substitute-el-with-list (l element new-list)
    (cond
        ((null l) nil)
        ((eq element (car l)) (append new-list (substitute-el-with-list (cdr l) element new-list)))
        ((atom (car l)) (cons (car l) (substitute-el-with-list (cdr l) element new-list)))
        (t (cons (substitute-el-with-list (car l) element new-list) (substitute-el-with-list (cdr l) element new-list)))
    )
)

(defun substitute-el-with-list-in (x element new-list)
    (cond
        ((equal x element) new-list)
        ((atom x) (list x))
        (t (list (apply #'append (mapcar #'(lambda (y) (substitute-el-with-list-in y element new-list)) x))))
    )
)

(defun substitute-el-with-list (x element new-list)
    (car (substitute-el-with-list-in x element new-list))
)

