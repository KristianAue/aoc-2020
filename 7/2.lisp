;;;; Task 2 for day 7 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defparameter *bag-contents* '()) ; global contents of each bag
(defparameter bag-contents '()) ; store bag contents temporarily for get-bag-contents function
(defparameter bag-specific-contents '()) ; specific contents to each bag (regex to make one list per bag)
(defun get-bag-contents ()
    (defparameter bag-parameters '())
    (dolist (bag *input*)
        (setf bag-contents '())
        (setf bag-parameters (cl-ppcre:register-groups-bind (b c)
            ("^(.*) bags contain (.*).$" bag)
            (list b c)))
        (dolist (contains (cl-ppcre:split ", " (nth 1 bag-parameters)))
            (setf bag-specific-contents (cl-ppcre:register-groups-bind (q ty)
                ("^([0-9]+) (.*) (bags|bag)$" contains)
                (list q ty)))
            (if bag-specific-contents
                (push bag-specific-contents bag-contents)))
        (push (list (nth 0 bag-parameters) bag-contents) *bag-contents*)))

(get-bag-contents)

(defvar current-bag '())
(defvar *ans*)
(defun total-combos (bag quantity)
    (setf *ans* 1)
    (setf current-bag (assoc bag *bag-contents* :test #'string=))
    (dolist (b (nth 1 current-bag))
        (setf *ans* (+ *ans* (* (parse-integer (nth 0 b)) (total-combos (nth 1 b) (parse-integer (nth 0 b)))))))
    (return-from total-combos *ans*))

(format t "Answer to part two: ~d ~%" (- (total-combos "shiny gold" 1) 1))