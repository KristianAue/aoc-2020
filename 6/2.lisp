;;;; Task 2 for day 6 of Advent of Code

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

(defun check-group-answer (text letter)
    (dolist (l (cl-ppcre:split "" text))
        (if (string-equal l letter)
            (return-from check-group-answer t)))
    (return-from check-group-answer nil))

(defun count-group-answers (group)
    (defparameter group-letters '())
    (defparameter people (cl-ppcre:split " " group))
    (defvar current-letter "")
    (defvar everyone-has-letter nil)
    (dotimes (x (length (nth 0 people)))
        (setf current-letter (nth x (cl-ppcre:split "" (nth 0 people))))
        (setf everyone-has-letter t)
        (dotimes (y (- (length people) 1))
            (if (not (check-group-answer (nth (+ y 1) people) current-letter))
                (setf everyone-has-letter nil)))
        (if (and everyone-has-letter (not (member current-letter group-letters :test #'string=)))
            (push current-letter group-letters)))
    (return-from count-group-answers (length group-letters)))

(defvar *answers* 0)
(dolist (form *forms*)
    (setf *answers* (+ *answers* (count-group-answers form))))

(format t "Answer to part two: ~d ~%" *answers*)