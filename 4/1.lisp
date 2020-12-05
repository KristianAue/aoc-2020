;;;; Task 1 for day 4 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *valid-passports* 0)
(defparameter *current-passport-parts* '())
(defparameter *current-passport-part* '())
(defparameter *passport-keys* '())
(dolist (line *passports*)
    (setf *current-passport-parts* (cl-ppcre:split " " line))
    (setf *passport-keys* '()) ; ensure *passport-keys* is empty
    (dolist (part *current-passport-parts*)
        (setf *current-passport-part* (cl-ppcre:split ":" part))
        (push (nth 0 *current-passport-part*) *passport-keys*))
    (if (and (member "ecl" *passport-keys* :test #'string=) (member "pid" *passport-keys* :test #'string=) (member "eyr" *passport-keys* :test #'string=) (member "hcl" *passport-keys* :test #'string=) (member "byr" *passport-keys* :test #'string=) (member "iyr" *passport-keys* :test #'string=) (member "hgt" *passport-keys* :test #'string=))
        (setf *valid-passports* (+ 1 *valid-passports*))))

(format t "Answer to part one: ~d ~%" *valid-passports*)