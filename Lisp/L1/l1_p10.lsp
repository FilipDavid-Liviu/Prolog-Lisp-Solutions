;10. 
;a) Write a function to return the product of all the numerical atoms from a list, at superficial level.
;b) Write a function to replace the first occurence of an element E in a given list with an other element O.
;c) Write a function to compute the result of an arithmetic expression memorised
;     in preorder on a stack. Examples: 
;     (+ 1 3) ==> 4  (1 + 3) 
;     (+ * 2 4 3) ==> 11  [((2 * 4) + 3) 
;     (+ * 2 4 - 5 * 2 2) ==> 9  ((2 * 4) + (5 - (2 * 2)) 
;d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the parameter
;list. Example:
;     (A B A B A C A) --> ((A 4) (B 2) (C 1)).


(defun product (lst)
    (cond
        ((null lst) 1)
        ((numberp (car lst)) (* (car lst) (product (cdr lst))))
        (t (product (cdr lst)))
    )
)

(defun replace (lst e o)
    (cond
        ((null lst) nil)
        ((eql (car lst) e) (cons o (cdr lst)))
        (t (cons (car lst) (replace (cdr lst) e o)))
    )
)

;c) Write a function to compute the result of an arithmetic expression memorised
;     in preorder on a stack. Examples: 
;     (+ 1 3) ==> 4  (1 + 3) 
;     (+ * 2 4 3) ==> 11  [((2 * 4) + 3) 
;     (+ * 2 4 - 5 * 2 2) ==> 9  ((2 * 4) + (5 - (2 * 2)) 
(defun evaluate-preorder (expr)
    (let ((stack nil)) ; Initialize an empty stack
        (dolist (token (reverse expr) (car stack)) ; Process tokens in reverse order
            (cond
                ((numberp token) ; If token is a number, push onto stack
                    (push token stack))
                ((member token '(+ - * /)) ; If token is an operator, pop operands
                    (let ((operand1 (pop stack))
                            (operand2 (pop stack)))
                         (push (case token
                            (+ (+ operand1 operand2))
                            (- (- operand1 operand2))
                            (* (* operand1 operand2))
                            (/ (/ operand1 operand2)))
                            stack)
                    )
                )
            )
        )
    )
)

;d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the parameter
;list. Example:
;     (A B A B A C A) --> ((A 4) (B 2) (C 1)).
(defun count-occurrences (atom lst)
    (cond
        ((null lst) 0)
        ((equal (car lst) atom) (1+ (count-occurrences atom (cdr lst))))
        (t (count-occurrences atom (cdr lst)))
    )
)
(defun remove-all (atom lst)
    (cond
        ((null lst) nil)
        ((equal (car lst) atom) (remove-all atom (cdr lst)))
        (t (cons (car lst) (remove-all atom (cdr lst))))
    )
)

(defun count-all (lst)
    (cond
        ((null lst) nil)
        (t (cons (list (car lst) (count-occurrences (car lst) lst)) (count-all (remove-all (car lst) lst))))
    )
)
