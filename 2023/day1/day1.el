(setq example (file-to-string "inputs/1-1.txt"))
(setq input (file-to-string "inputs/1-2.txt"))

(defun first-digit (str)
  (when (string-match "[0-9]" str)
    (match-string 0 str)))

(defun cal-value (line)
  (let ((first-digit (first-digit line))
        (last-digit (first-digit (reverse line))))
    (string-to-number (concat first-digit last-digit))))

(defun parse (input)
  (split-string input "\n"))

(defun sum-cal-values (lines)
  (reduce '+ (mapcar #'cal-value lines)))

(eq (sum-cal-values (parse example)) 142)
(sum-cal-values (parse input))
