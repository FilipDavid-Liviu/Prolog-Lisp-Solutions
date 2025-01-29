; factorial(n) = 1, if n = 0
;              = n * factorial(n-1), if n > 0
(defun factorial (n)
    ( cond
        ((= n 0) 1)
        (t (* n (factorial (- n 1))))
    )
)

; sum(l1,l2,...,ln) = 0, if n = 0   
;                   = l1 + sum(l2,l3,...,ln), if n > 0
(defun sum (l)
    (cond
        ((null l) 0)
        (t (+ (car l) (sum (cdr l))))
    )
)

; sumc(l1,l2,...,ln, c) = c, if n = 0
;                       = sumc(l2,l3,...,ln, c + l1), if n > 0

(defun sumc (l c)
    (cond
        ((null l) c)
        (t (sumc (cdr l) (+ c (car l))))
    )
)

(defun mainsc (l)
    (sumc l 0)
)

;Merge two sorted lists without putting duplicates only once
;(l1,l2,...,ln, p1,p2,...,pm) = { [], if n = 0 and m = 0
;                                 (l1,l2,...,ln), if m = 0
;                                 (p1,p2,...,pm), if n = 0
;                                 l1 + merge(l2,l3,...,ln, p1,p2,...,pm), if l1 < p1
;                                 p1 + merge(l1,l2,...,ln, p2,p3,...,pm), if l1 > p1
;                                 l1 + merge(l2,l3,...,ln, p2,p3,...,pm), if l1 = p1
(defun merge (L, P)
    (cond
        ((null L) P)
        ((null P) L)
        ((< (car L) (car P)) (cons (car L) (merge (cdr L) P)))
        ((> (car L) (car P)) (cons (car P) (merge L (cdr P))))
        (t (cons (car L) (merge (cdr L) (cdr P))))
    )
)

;remE all occurences of an alement from a nonlinear list
;ex (2 1 (a (7 1) 3 ) 1 1 c (1)), e = 1 => (2 (a (7) 3) c ())
;(l, e) = [], if l = []
;         = remE(l2,...,ln, e), if l1 = e
;         = remE(l1, e) U remE(l2,...,ln, e), if l1 is a list
;         = l1 U remE(l2,...,ln, e), otherwise

(defun remE (l, e)
    (cond
        ((null l) ())
        ((and (atom (car l)) (equal (car l) e)) (remE (cdr l) e))
        ((atom (car l)) (cons (car l) (remE (cdr l) e)))
        (t (cons (remE (car l) e) (remE (cdr l) e)))
        ;use append to flatten the list
    )
)

;Build a list with the positions of the minimum element of a linear list; there can be atoms that are not numbers
(defun find_min (l, cmin)
    (cond
        ((null l) cmin)
        ((and (numberp (car l)) (or (null cmin) (< (car l) cmin))) (find_min (cdr l) (car l)))
        (t (find_min (cdr l) cmin))
    )
)

(defun pos_of_elem (l, e, i)
    (cond
        ((null l) nil)
        ((equal (car l) e) (cons i (pos_of_elem (cdr l) e (+ i 1))))
        (t (pos_of_elem (cdr l) e (+ i 1)))
    )
)

(defun pos_of_min (l)
    (pos_of_elem l (find_min l) 1)
)