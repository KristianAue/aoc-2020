;;;; Task 1 for day 8 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *accumulator* 0)
(defparameter *seen-instructions* '())
(defparameter line-parts '())
(defun run (line)
    (setf line-parts ())
    (if (not (member line *seen-instructions*))
        (progn 
            (push line *seen-instructions*)
            (setf line-parts (cl-ppcre:split " " (nth line *input*)))
            (if (string-equal (nth 0 line-parts) "acc")
                (progn 
                    (setf *accumulator* (+ *accumulator* (parse-integer (nth 1 line-parts))))
                    (run (+ line 1))))
            (if (string-equal (nth 0 line-parts) "jmp")
                (run (+ line (parse-integer (nth 1 line-parts))))); jump x lines up/down
            (if (string-equal (nth 0 line-parts) "nop")
                (run (+ line 1)))))) ; do nothing, run next line

(run 0)

(format t "Answer to part one: ~d ~%" *accumulator*)