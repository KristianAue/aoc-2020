;;;; Task 1 for day 8 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(defvar *valid* nil)
(defvar l)
(defvar num)
(defun check-validity (line)
    (defparameter preamble '())
    (setf l (nth line *input*))
    (setf *valid* nil)
    
    (dotimes (x 25)
        (push (parse-integer (nth (+ line (- 25) x) *input*)) preamble))

    (dolist (p preamble)
        (if (and (member (- (parse-integer l) p) preamble) (not *valid*))
            (setf *valid* t)))

    (if (not *valid*)
        (return-from check-validity (parse-integer l)))

    (if (< line (length *input*))
        (check-validity (+ line 1))))

(format t "Answer to part one: ~d ~%" (check-validity 25))