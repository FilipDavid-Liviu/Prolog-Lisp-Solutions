(defun replace-node-ntree (tree node new-node)
    (cond
        ((null tree) nil)
        ((eq (car tree) node) (cons new-node (replace-node-ntree (cdr tree) node new-node)))
        ((atom (car tree)) (cons (car tree) (replace-node-ntree (cdr tree) node new-node)))
        (t (cons (replace-node-ntree (car tree) node new-node) (replace-node-ntree (cdr tree) node new-node)))
    )
)