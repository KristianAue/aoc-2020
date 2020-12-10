;;;; Task 1 for day 8 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(defvar *one-diff* 0)
(defvar *three-diff* 0)
(defun calculate-jolt-diff (start jolt)
    (if (nth start *jolts*)
        (cond ( (= (nth start *jolts*) (+ jolt 1))
            (setf *one-diff* (+ *one-diff* 1))
            (calculate-jolt-diff (+ start 1) (+ jolt 1)))
        ( (= (nth start *jolts*) (+ jolt 3))
            (setf *three-diff* (+ *three-diff* 1))
            (calculate-jolt-diff (+ start 1) (+ jolt 3))))))

(calculate-jolt-diff 0 0)

(format t "Answer to part one: ~d ~%" (* *one-diff* *three-diff*))