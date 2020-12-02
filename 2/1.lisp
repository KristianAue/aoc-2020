;;;; Task 1 for day 2 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defparameter *parts* Nil)
(defparameter *requirements* Nil)
(defvar *char* Nil)
(defvar *password* Nil)
(defvar *occurences* 0)
(defvar *valid-passwords* 0)
(dolist (line *input*)
    (setf *parts* (cl-ppcre:split " " line))
    (setf *requirements* (cl-ppcre:split "-" (car *parts*)))
    (setf *char* (cl-ppcre:regex-replace ":" (cadr *parts*) ""))
    (setf *password* (caddr *parts*))
    (setf *occurences* (length (cl-ppcre:all-matches-as-strings *char* *password*)))
    (if (and (>= *occurences* (parse-integer (car *requirements*))) (<= *occurences* (parse-integer (cadr *requirements*))))
        (setf *valid-passwords* (+ 1 *valid-passwords*))))

(format t "Answer to part one: ~d ~%" *valid-passwords*)