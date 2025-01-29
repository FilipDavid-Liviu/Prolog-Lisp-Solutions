; elimin(e, [l1,l2,l3...ln]) { [], n = 0
;                            { [l2,l3...ln], l1 = e
;                            { elimin(e, [l1(1),l2(1),l3(1)...ln(1)]) U [l2,l3...ln], l1 is a list containing e
;                            { l1 U elimin(e, [l2,l3...ln]), otherwise

(defun elimin (e lst)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) (cdr lst))
        ((and (listp (car lst)) (is-member-p e (car lst))) (cons (elimin e (car lst)) (cdr lst)))
        (t (cons (car lst) (elimin e (cdr lst))))3
    )
)
; is-member-p(e, [l1,l2,l3...ln]) { false, n = 0
;                                 { true, l1 = e
;                                 { is-member-p(e, [l2,l2,l3...ln]), l1 is atom (not list)
;                                 { is-member-p(e, [l1(1),l2(1),l3(1)...ln(1)]) OR is-member-p(e, [l2,l2,l3...ln]), otherwise (l1 is a list)
(defun is-member-p (e lst)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) t)
        ((atom (car lst)) (is-member-p e (cdr lst)))
        (t (or (is-member-p e (car lst)) (is-member-p e (cdr lst))))
    )
)
