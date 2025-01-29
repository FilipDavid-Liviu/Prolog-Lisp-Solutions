(defun compute-depth (x)
    (cond
        ((atom x) 0)
        (t (1+ (apply #'max (mapcar #'compute-depth x))))
    )
)

(defun leaf-number (x)
    (cond
        ((atom x) 0)
        ((and (car x) (null (cdr x))) 1)
        (t (apply #'+ (mapcar #'leaf-number x)))
    )
)