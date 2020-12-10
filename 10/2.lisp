;;;; Task 1 for day 8 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(push 0 *jolts*) ; add 0 to start of jolts array to ensure it is calculated with the combos

(defparameter *seen* '()) ; create list of seen combos
(defvar *ans* 0) ; answer for part two is stored in this variable
(defun adapter-combos (n)
    (if (= n (- (length *jolts*) 1))
        (return-from adapter-combos 1)) ; check if n is last element; if so return 1
    (if (assoc n *seen*)
        (return-from adapter-combos (cadr (assoc n *seen*)))) ; check if already calculated; if so return associated value
    
    (loop for x from (+ n 1) to (length *jolts*)
        do (if (and (nth x *jolts*) (nth n *jolts*) (<= (- (nth x *jolts*) (nth n *jolts*)) 3))
                (setf *ans* (+ *ans* (adapter-combos x))))) ; loop through each element starting at n+1, ending at the length of the jolts list, and recursively add the value to the *ans* variable

    (push (list n *ans*) *seen*) ; push a list of n and *ans* to the *seen* list
    (return-from adapter-combos *ans*)) ; return *ans* at end of function

(format t "Answer to part two: ~d ~%" (adapter-combos 0)) ; print out answer