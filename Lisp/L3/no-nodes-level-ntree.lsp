(defun no-nodes-level-ntree (tree level)
    (cond
        ((null tree) 0)
        ((= level 0) 1)
        ((atom (car tree)) (no-nodes-level-ntree (cdr tree) level))
        (t (+ (no-nodes-level-ntree (car tree) (1- level)) (no-nodes-level-ntree (cdr tree) level)))
    )
)

(defun atoms-on-level (x k)
    (cond
        ((and (atom x) (eql k 0)) 1)
        ((atom x) 0)
        (t (apply #'+ (mapcar #'(lambda (y) (atoms-on-level y (1- k))) x)))
    )
)