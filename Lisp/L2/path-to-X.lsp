; type 1 -> '(A 2 B 2 D 0 E 1 G 0 C 1 F 1 H 0)
(defun path-to-X (tree X)
    (cond
        ((null tree) nil)
        ((equal (car tree) X) (list X))
        ((= (cadr tree) 0) nil)
        (t (let ((left-path (path-to-X (cddr tree) X))
                (right-path (path-to-X (get-right tree) X)))
            (cond
                ((null left-path) (if right-path
                    (cons (car tree) right-path) 
                    nil))
                (t (cons (car tree) left-path))))
        )
    )
)

(defun get-right (tree)
    (cond
        ((null tree) nil)
        ((= (cadr tree) 1) nil)
        (t (get-right-aux (cddr tree) (cadr tree)))
    )
)

(defun get-right-aux (tree branches)
    (cond
        ((or (null tree) (= branches 0)) nil)
        ((= branches 1) tree)
        (t (get-right-aux (cddr tree) (- (+ branches (cadr tree)) 1)))
    )
)

; type 2 -> '(A (B (D) (E (G))) (C (F (H))))

(defun path-to-X (tree X)
    (cond
        ((null tree) nil)
        ((equal (car tree) X) (list X))
        (t (let ((left-path (path-to-X (cadr tree) X))
                (right-path (path-to-X (caddr tree) X)))
            (cond
                ((null left-path) (if right-path
                    (cons (car tree) right-path) 
                    nil))
                (t (cons (car tree) left-path))))
        )
    )
)