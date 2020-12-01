;;;; Task 1 for day 1 of Advent of Code

;;; First of, import numbers list from n numbers.lisp
(ext:cd *load-truename*)
(load "numbers.lisp")

;;; Part one is storing each value in a hash table and comparing the results. Runtime: O(n)
(defun partone ()
    (defparameter loopednums (make-hash-table))
    (dolist (num *input*)
        (if (gethash (- 2020 num) loopednums)
            (return-from partone(* (gethash (- 2020 num) loopednums) num))
            (setf (gethash num loopednums) num))))

(format t "Answer to part one: ~d ~%" (partone))