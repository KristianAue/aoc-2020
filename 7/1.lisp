;;;; Task 1 for day 7 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defparameter *combinations* '())
(defun bags-combinations (bag-type)
    (if (and (not (string-equal bag-type "shiny gold")) (not (member bag-type *combinations* :test #'string=)))
        (push bag-type *combinations*))
    (dolist (bag *input*)
        (if (cl-ppcre:scan (concatenate 'string "^([a-z ]+) bags contain (.*)([1-9]+) " bag-type " (bag|bags)(.*).$") bag)
            (bags-combinations (nth 0 (cl-ppcre:split " bags contain" bag))))))

(bags-combinations "shiny gold")

(format t "Answer to part one: ~d ~%" (length *combinations*))