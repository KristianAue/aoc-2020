;;; First of, load numbers.txt and parse everything into a list
(ext:cd *load-truename*)
(defun readinput ()
    (with-open-file (in "jolts.txt")
        (loop for line = (read-line in nil)
            while line
            collect line)))

(defparameter *input* (readinput))

(defparameter *jolts* '())
(dolist (jolt *input*)
    (push (parse-integer jolt) *jolts*))

(sort *jolts* #'<) ; sort jolts by smallest to biggest
(nconc *jolts* (list (+ (nth (- (length *jolts*) 1) *jolts*) 3))) ; append jolts list with a jolt 3 bigger than highest value