;;; First of, load passports.txt and parse everything into a list
(ext:cd *load-truename*)
(defun readinput ()
    (with-open-file (in "passports.txt")
        (loop for line = (read-line in nil)
            while line
            collect line)))

(defparameter *input* (readinput))
(defparameter *passports* '())
(defvar *current-passport* "")
(defun retrieve-passports ()
    (dotimes (x (length *input*))
        (if (string-equal "" (nth x *input*))
            (progn
                (if (not *passports*)
                    (push *current-passport* *passports*) ; set first passport in list if empty
                    (nconc *passports* (list *current-passport*))) ; append to list if not empty
                (setf *current-passport* "")) ; append *current-passport* to *passports* list and ensure it is set to empty to go to next passport
            (setf *current-passport* (concatenate 'string *current-passport* " " (nth x *input*)))) ; append *current-passport* with this lines data
        ))

(retrieve-passports)