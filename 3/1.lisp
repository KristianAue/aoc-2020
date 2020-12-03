;;;; Task 1 for day 3 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *trees* 0)
(defvar *coordinateX* 0)
(defvar *repeats* 1)
(defvar *repeatedline* "")
(dolist (line *input*)
    (setf *repeatedline* "")
    (if (> *coordinateX* (length line))
        (setf *repeats* (ceiling (/ *coordinateX* (length line)))))
    (if (> *coordinateX* (length *repeatedline*))
        (setf *repeats* (+ 1 *repeats*))) ; ensure repeats is high enough to avoid nil results
    (dotimes (repeat *repeats*)
        (setf *repeatedline* (concatenate 'string *repeatedline* line)))
    (if (string-equal (nth *coordinateX* (cl-ppcre:split "" *repeatedline*)) "#")
        (setf *trees* (+ 1 *trees*)))
    (setf *coordinateX* (+ 3 *coordinateX*)))

(format t "Answer to part one: ~d ~%" *trees*)