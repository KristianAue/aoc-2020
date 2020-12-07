;;; First of, load forms.txt and parse everything into a list
(ext:cd *load-truename*)
(defun readinput ()
    (with-open-file (in "forms.txt")
        (loop for line = (read-line in nil)
            while line
            collect line)))

(defparameter *input* (readinput))

(defparameter *forms* '())
(defvar *current-form* "")
(defun retrieve-forms ()
    (dotimes (x (length *input*))
        (if (string-equal "" (nth x *input*))
            (progn
                (if (not *forms*)
                    (push *current-form* *forms*) ; set first form in list if empty
                    (nconc *forms* (list *current-form*))) ; append to list if not empty
                (setf *current-form* "")) ; append *current-form* to *forms* list and ensure it is set to empty to go to next passport
            (setf *current-form* (concatenate 'string *current-form* (nth x *input*) " "))) ; append *current-form* with this lines data
        ))

(retrieve-forms)