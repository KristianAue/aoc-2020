;;;; Task 2 for day 2 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defparameter *parts* Nil)
(defparameter *requirements* Nil)
(defvar *char* Nil)
(defparameter *password* Nil)
(defvar *valid-passwords* 0)
(dolist (line *input*)
    (setf *parts* (cl-ppcre:split " " line))
    (setf *requirements* (cl-ppcre:split "-" (car *parts*)))
    (setf *char* (cl-ppcre:regex-replace ":" (cadr *parts*) ""))
    (setf *password* (cl-ppcre:split "" (caddr *parts*)))
    (if (or (and (string-equal *char* (nth (- (parse-integer (car *requirements*)) 1) *password* )) (not (string-equal *char* (nth (- (parse-integer (cadr *requirements*)) 1) *password*)))) (and (not (string-equal *char* (nth (- (parse-integer (car *requirements*)) 1) *password* ))) (string-equal *char* (nth (- (parse-integer (cadr *requirements*)) 1) *password*))))
        (setf *valid-passwords* (+ 1 *valid-passwords*))))

(format t "Answer to part two: ~d ~%" *valid-passwords*)