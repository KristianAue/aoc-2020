;;;; Task 1 for day 6 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *scan-letter* (cl-ppcre:create-scanner "^([a-z])$"))

(defun count-unique-letters (group)
    (defparameter *group-letters* '())
    (dolist (letter (cl-ppcre:split "" group))
        (if (and (not (member letter *group-letters* :test #'string=)) (cl-ppcre:scan *scan-letter* letter))
            (push letter *group-letters*)))
    (return-from count-unique-letters (length *group-letters*)))

(defvar *answers* 0)
(dolist (form *forms*)
    (setf *answers* (+ *answers* (count-unique-letters form))))

(format t "Answer to part one: ~d ~%" *answers*)