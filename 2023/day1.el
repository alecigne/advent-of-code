(setq calibration-document "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet")

(defun find-first-digit (str)
  (when (string-match "[0-9]" str)
    (match-string 0 str)))

(defun number-from-line (str)
  (let ((first-digit (find-first-digit str))
        (last-digit (find-first-digit (reverse str))))
    (string-to-number (concat first-digit last-digit))))

(defun parse-calibration-document (document)
  (split-string document "\n"))

(parse-calibration-document calibration-document)

(defun sum-calibration-values (document)
  (reduce '+ (mapcar #'number-from-line (parse-calibration-document document))))

(mapcar #'string (string-to-list "abc"))
