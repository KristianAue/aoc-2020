;;; First of, load trees.txt and parse everything into a list
(ext:cd *load-truename*)
(defun readinput ()
    (with-open-file (in "trees.txt")
        (loop for line = (read-line in nil)
            while line
            collect line)))

(defparameter *input* (readinput))