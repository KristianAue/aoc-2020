;;; First of, load numbers.txt and parse everything into a list
(ext:cd *load-truename*)
(defun readinput ()
    (with-open-file (in "numbers.txt")
        (loop for line = (read-line in nil)
            while line
            collect line)))

(defparameter *input* (readinput))