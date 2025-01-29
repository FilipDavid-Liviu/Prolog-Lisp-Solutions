; type 2 -> '(A (B (D) (E (G))) (C (F (H))))

(defun max-nodes-level (tree)
    (cond
        ((null tree) (list nil nil))
        (t (max-nodes-level-aux tree 0 nil nil 0))
    )
)
(defun max-nodes-level-aux (tree level max-level max-nodes max-length)
    (cond
        ((null (nodes-on-level tree level)) (list max-level max-nodes))
        (t (let ((nodes-at-level (nodes-on-level tree level)))
            (if (> (length nodes-at-level) max-length)
                (max-nodes-level-aux tree (1+ level) level nodes-at-level (length nodes-at-level))
                (max-nodes-level-aux tree (1+ level) max-level max-nodes max-length)))
        )
    )
)

(defun nodes-on-level (tree level)
    (cond
        ((null tree) nil)
        (t (nodes-on-level-aux tree level 0))
    )
)

(defun nodes-on-level-aux (tree level current-level)
    (cond
        ((null tree) nil)
        ((= current-level level) (list (car tree)))
        (t (append (nodes-on-level-aux (cadr tree) level (+ current-level 1))
                (nodes-on-level-aux (caddr tree) level (+ current-level 1)))
        )
    )
)