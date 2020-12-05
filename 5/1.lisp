;;;; Task 1 for day 5 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *max-seat-id* 0)
(defvar *current-seat-id* 0)
(defvar *current-seat-row* 0)
(defvar *current-seat-col* 0)

(defun find-row-or-col (parts &optional (start 0) (end 127))
    (dolist (part parts)
        (if (or (string-equal "F" part) (string-equal "L" part))
            (setf end (floor (+ start (/ (- end start) 2)))))
        (if (or (string-equal "B" part) (string-equal "R" part))
            (setf start (ceiling (+ start (/ (- end start) 2))))))
        (if (= start end)
            (return-from find-row-or-col start)))

(defun calculate-seat-id (pass-parts)
    (setf *current-seat-row* (find-row-or-col (subseq pass-parts 0 7)))
    (setf *current-seat-col* (find-row-or-col (subseq pass-parts 7 10) 0 7))
    (setf *current-seat-id* (+ (* *current-seat-row* 8) *current-seat-col*))
    (if (> *current-seat-id* *max-seat-id*)
        (setf *max-seat-id* *current-seat-id*)))

(dolist (pass *input*)
    (calculate-seat-id (cl-ppcre:split "" pass)))

(format t "Answer to part one: ~d ~%" *max-seat-id*)