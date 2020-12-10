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

(defparameter *contiguous-set* '())
(defvar *contiguous-val* 0)
(defvar *invalid-number* (check-validity 25)) ; find invalid number as this is a key to solve this puzzle
(defun get-set (line)
    (setf *contiguous-set* '())
    (setf *contiguous-val* 0)

    (dotimes (num (+ (length *input*) (- line)))
        (push (parse-integer (nth (+ num line) *input*)) *contiguous-set*)
        (setf *contiguous-val* (+ *contiguous-val* (parse-integer (nth (+ num line) *input*))))
        (if (= *contiguous-val* *invalid-number*)
            (setf num 1000))
        (if (> *contiguous-val* *invalid-number*)
            (setf num 1000)))

    (if (> *contiguous-val* *invalid-number*)
        (get-set (+ line 1)))   

    (if (= *contiguous-val* *invalid-number*)
        (return-from get-set *contiguous-set*))   
    
    (return-from get-set nil))

(defun check-encryption ()
    (defparameter enc-set (sort (get-set 0) #'<))
    (return-from check-encryption (+ (nth 0 enc-set) (nth (- (length enc-set) 1) enc-set))))

(format t "Answer to part two: ~d ~%" (check-encryption))