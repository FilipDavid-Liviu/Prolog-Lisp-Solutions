;a)
; set-union([l1,l2,...,ln], [p1,p2,...,pm]) = { [p1,p2,...,pm], if n = 0
;                                               set-union([l2,...,ln], [p1,p2,...,pm]), if l1 is in [p1,p2,...,pm]
;                                               l1 U set-union([l2,...,ln], [p1,p2,...,pm]), otherwise                                           
(defun set-union (set1 set2)'
    "Returns the union of two sets"
    (cond
        ((null set1) set2)
        ((is-member-p (car set1) set2) (set-union (cdr set1) set2))
        (t (cons (car set1) (set-union (cdr set1) set2)))
    )
)
; is-member-p(e, [l1,l2,...,ln]) = { false, if n = 0
;                                    true, if e = l1
;                                    is-member-p(e, [l2,...,ln]), otherwise
(defun is-member-p (item set)
    "Checks if an item is a member of a set"
    (cond
        ((null set) nil)
        ((equal item (car set)) t)
        (t (is-member-p item (cdr set)))
    )
)
;b)
; product-of-numerical-atoms([l1,l2,...,ln]) = { 1, if n = 0
;                                                l1 * product-of-numerical-atoms([l2,...,ln]), if l1 is a number
;                                                product-of-numerical-atoms(l1) * product-of-numerical-atoms([l2,...,ln]), if l1 is a list
;                                                product-of-numerical-atoms([l2,...,ln]), otherwise
(defun product-of-numerical-atoms (lst)
    "Calculates the product of numerical atoms in a nonlinear list"
    (cond
        ((null lst) 1)
        ((numberp (car lst)) (* (car lst) (product-of-numerical-atoms (cdr lst))))
        ((listp (car lst)) (* (product-of-numerical-atoms (car lst)) (product-of-numerical-atoms (cdr lst))))
        (t (product-of-numerical-atoms (cdr lst)))
    )
)
;c)
; sort-list([l1,l2,...,ln]) = { [], if n = 0
;                               insert-sorted(l1, sort-list([l2,...,ln])), otherwise
(defun sort-list (lst)
    "Sorts a list"
    (cond
        ((null lst) nil)
        (t (insert-sorted (car lst) (sort-list (cdr lst))))
    )
)
; insert-sorted(item, [l1,l2,...,ln]) = { [item], if n = 0
;                                         [item, l1,l2,...,ln], if item <= l1
;                                         [l1, insert-sorted(item, [l2,...,ln])], otherwise
(defun insert-sorted (item sorted-list)
    "Inserts an item into a sorted list"
    (cond
        ((null sorted-list) (list item))
        ((<= item (car sorted-list)) (cons item sorted-list))
        (t (cons (car sorted-list) (insert-sorted item (cdr sorted-list))))
    )
)
;d)
; pos-of-item([l1,l2,...,ln], e, i) = { [], if n = 0
;                                       [i] U pos-of-item([l2,...,ln], e, i + 1), if l1 = e
;                                       pos-of-item([l2,...,ln], e, i + 1), otherwise
(defun pos-of-item (lst item index)
    "Returns the positions of an item in a list"
    (cond
        ((null lst) nil)
        ((equal item (car lst)) (cons index (pos-of-item (cdr lst) item (+ index 1))))
        (t (pos-of-item (cdr lst) item (+ index 1)))
    )
)
; find-min([l1,l2,...,ln], cmin) = { cmin, if n = 0
;                                    find-min([l2,...,ln], l1), if l1 is a number and cmin is null or l1 < cmin
;                                    find-min([l2,...,ln], cmin), otherwise
(defun find-min (lst cmin)
    "Finds the minimum element in a list"
    (cond
        ((null lst) cmin)
        ((and (numberp (car lst)) (or (null cmin) (< (car lst) cmin))) (find-min (cdr lst) (car lst)))
        (t (find-min (cdr lst) cmin))
    )
)
; pos-of-min([l1,l2,...,ln]) = pos-of-item([l1,l2,...,ln], find-min([l1,l2,...,ln], nil), 1)
(defun pos-of-min (lst)
    "Returns the positions of the minimum element in a list"
    (pos-of-item lst (find-min lst nil) 1)
)

; pos-of-min([l1,l2,...,ln], cmin, i, cpos) = { cpos, if n = 0
;                                               pos-of-min([l2,...,ln], l1, i + 1, [i]), if l1 is a number and cmin is null or l1 < cmin
;                                               pos-of-min([l2,...,ln], cmin, i + 1, [cpos, i]), if l1 is a number and cmin = l1
;                                               pos-of-min([l2,...,ln], cmin, i + 1, cpos), otherwise
(defun pos-of-min-in (lst cmin index cpos)
    (cond
        ((null lst) cpos)
        ((and (numberp (car lst)) (or (null cmin) (< (car lst) cmin))) (pos-of-min-in (cdr lst) (car lst) (+ index 1) (list index)))
        ((and (numberp (car lst)) (= (car lst) cmin)) (pos-of-min-in (cdr lst) cmin (+ index 1) (append cpos (list index))))
        (t (pos-of-min-in (cdr lst) cmin (+ index 1) cpos))
    )
)
(defun pos-of-min-wrapper (lst)
    "Returns the positions of the minimum elemment in a list"
    (pos-of-min-in lst nil 1 nil)
)
