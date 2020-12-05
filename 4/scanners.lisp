(defvar *scan-byr* (cl-ppcre:create-scanner "^((19[2-9][0-9])|(200[0-2]))$"))
(defvar *scan-iyr* (cl-ppcre:create-scanner "^((201[0-9])|(2020))$"))
(defvar *scan-eyr* (cl-ppcre:create-scanner "^((202[0-9])|(2030))$"))
(defvar *scan-hgt* (cl-ppcre:create-scanner "^((((1[5-8][0-9])|(19[0-3]))cm)|(((59)|(6[0-9])|(7[0-6]))in))$"))
(defvar *scan-hcl* (cl-ppcre:create-scanner "^(#([a-f0-9]{6}))$"))
(defvar *scan-ecl* (cl-ppcre:create-scanner "^((amb)|(blu)|(brn)|(gry)|(grn)|(hzl)|(oth))$"))
(defvar *scan-pid* (cl-ppcre:create-scanner "^([0-9]{9})$"))