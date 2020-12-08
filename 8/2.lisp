;;;; Task 2 for day 8 of Advent of Code

;;; First of, import input ready for usage
(ext:cd *load-truename*)
(load "input.lisp")

(load "../quicklisp/setup.lisp")

(ql:quickload :cl-ppcre :silent T)

(defvar *accumulator* 0)
(defparameter *seen-instructions* '())
(defparameter line-parts '())
(defvar *executed-successfully* nil)
(defun run (line change-line change-command)
    (setf line-parts ())
    (if (>= line (length *input*))
        (setf *executed-successfully* t))
    (if (not (member line *seen-instructions*))
        (progn 
            (push line *seen-instructions*)
            (if (= line change-line)
                (setf line-parts change-command)
                (setf line-parts (cl-ppcre:split " " (nth line *input*))))
            (if (string-equal (nth 0 line-parts) "acc")
                (progn 
                    (setf *accumulator* (+ *accumulator* (parse-integer (nth 1 line-parts))))
                    (run (+ line 1) change-line change-command)))
            (if (string-equal (nth 0 line-parts) "jmp")
                (run (+ line (parse-integer (nth 1 line-parts))) change-line change-command)); jump x lines up/down
            (if (string-equal (nth 0 line-parts) "nop")
                (run (+ line 1) change-line change-command))))) ; do nothing, run next line

(defparameter test-parts '())
(defun test-program (line)
    (if (and (not *executed-successfully*) (< line (length *input*)))
        (progn 
            ;; Set all necessary variables back to defaults to ensure test is reset
            (setf *accumulator* 0)
            (setf *seen-instructions* '())
            (setf line-parts ())
            (setf test-parts ())
            (setf test-parts (cl-ppcre:split " " (nth line *input*)))
            (if (string-equal "acc" (nth 0 test-parts))
                (test-program (+ line 1)) ; go to next line; acc is not corrupt
                (progn
                    (if (string-equal "jmp" (nth 0 test-parts))
                        (run 0 line (list "nop" (nth 1 test-parts))))

                    (if (string-equal "nop" (nth 0 test-parts))
                        (run 0 line (list "jmp" (nth 1 test-parts))))
                    
                    (if (not *executed-successfully*)
                        (test-program (+ line 1)))))))) ; method to test program by changing lines

(test-program 0)

(format t "Answer to part two: ~d ~%" *accumulator*)