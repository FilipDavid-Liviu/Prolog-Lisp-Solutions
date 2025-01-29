(defun depth-ntree (tree)
    (cond
        ((null tree) 0)
        (t (1+ (depth-ntree-aux tree)))
    )  
)

(defun depth-ntree-aux (tree)
    (cond
        ((null tree) 0)
        ((atom (car tree)) (depth-ntree-aux (cdr tree)))
        (t (max (1+ (depth-ntree-aux (car tree))) (depth-ntree-aux (cdr tree))))
    )
)

(defun compute-depth (x)
    (cond
        ((atom x) 0)
        (t (1+ (apply #'max (mapcar #'compute-depth x))))
    )
)