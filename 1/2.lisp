;;;; Task 2 for day 1 of Advent of Code

;;; First of, import numbers list from n numbers.lisp
(ext:cd *load-truename*)
(load "numbers.lisp")

;;; Part two uses hash table to retrieve the results with two loops. Runtime: O(n^2)
(defun parttwo ()
    (defvar listlength (length *input*))
    (defvar tmpnum)
    (defvar tmpx)
    (defvar tmpy)
    (dotimes (x listlength)
        (defparameter loopednums (make-hash-table))
        (setf tmpx (nth x *input*))
        (setf tmpnum (- 2020 tmpx))
        (dotimes (y (- listlength x))
            (setf tmpy (nth y *input*))
            (if (gethash (- tmpnum tmpy) loopednums)
                (return-from parttwo(* (gethash (- tmpnum tmpy) loopednums) tmpy tmpx))
                (setf (gethash tmpy loopednums) tmpy)))))

(format t "Answer to part two: ~d ~%" (parttwo))