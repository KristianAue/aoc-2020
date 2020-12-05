;;;; Task 2 for day 4 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(load "scanners.lisp")

(defvar *valid-passports* 0)
(defparameter *current-passport-parts* '())
(defparameter *current-passport-part* '())
(defparameter *passport-data* '())
(defvar *passport-data-key* "")
(defvar *passport-data-value* "")
(defvar *valid-passport* T)
(defparameter *passport-keys* '())
(dolist (line *passports*)
    (setf *current-passport-parts* (cl-ppcre:split " " line))
    (setf *passport-data* '()) ; ensure *passport-data* is empty
    (setf *passport-keys* '()) ; ensure *passport-keys* is empty
    (setf *valid-passport* T) ; ensure valid passport starts at true
    (dolist (part *current-passport-parts*)
        (setf *current-passport-part* (cl-ppcre:split ":" part))
        (push (nth 0 *current-passport-part*) *passport-keys*)
        (push (list (nth 0 *current-passport-part*) (nth 1 *current-passport-part*)) *passport-data*))
    (dolist (data *passport-data*)
        (setf *passport-data-key* (nth 0 data))
        (setf *passport-data-value* (nth 1 data))
        (if (and (string-equal *passport-data-key* "byr") (not (cl-ppcre:scan *scan-byr* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "iyr") (not (cl-ppcre:scan *scan-iyr* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "eyr") (not (cl-ppcre:scan *scan-eyr* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "hgt") (not (cl-ppcre:scan *scan-hgt* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "hcl") (not (cl-ppcre:scan *scan-hcl* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "ecl") (not (cl-ppcre:scan *scan-ecl* *passport-data-value*)))
            (setf *valid-passport* Nil))
        (if (and (string-equal *passport-data-key* "pid") (not (cl-ppcre:scan *scan-pid* *passport-data-value*)))
            (setf *valid-passport* Nil)))
        ;(if (and (string-equal *passport-data-key* "byr"))
        ;    (setf *valid-passport* Nil)))
    (if (and (member "ecl" *passport-keys* :test #'string=) (member "pid" *passport-keys* :test #'string=) (member "eyr" *passport-keys* :test #'string=) (member "hcl" *passport-keys* :test #'string=) (member "byr" *passport-keys* :test #'string=) (member "iyr" *passport-keys* :test #'string=) (member "hgt" *passport-keys* :test #'string=) *valid-passport*)
        (setf *valid-passports* (+ 1 *valid-passports*))))

(format t "Answer to part two: ~d ~%" *valid-passports*)