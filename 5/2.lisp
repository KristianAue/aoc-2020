;;;; Task 2 for day 5 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *my-seat-id* 0)
(defvar *current-seat-row* 0)
(defvar *current-seat-col* 0)
(defparameter *seats* '())

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
    (push *current-seat-id* *seats*))

(defun find-my-seat (seats)
    (dolist (seat seats)
        (if (and (member (- seat 2) seats) (not (member (- seat 1) seats)))
        (return-from find-my-seat (- seat 1)))))

(dolist (pass *input*)
    (calculate-seat-id (cl-ppcre:split "" pass)))

(setf *my-seat-id* (find-my-seat *seats*))

(format t "Answer to part two: ~d ~%" *my-seat-id*)