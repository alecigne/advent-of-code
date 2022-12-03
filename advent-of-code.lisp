;;;; advent-of-code.lisp

(in-package #:advent-of-code)

;;;;;;;;;;;;;;;;
;; 2022-12-01 ;;
;;;;;;;;;;;;;;;;

(defun load-elf-bags (path-to-input)
  (let ((input (uiop:read-file-lines path-to-input)))
    (mapcar #'(lambda (bag) (mapcar #'(lambda (calories) (parse-integer calories)) bag))
            (split-sequence:split-sequence "" input :test #'string=))))

(defvar *elf-bags* (load-elf-bags #P"2022-12-01.txt"))

;; Part 1

(defun calories-in-bag (bag) (reduce #'+ bag))

(defun most-calories-one-elf (bags)
  (reduce #'max bags :key #'calories-in-bag))

(most-calories-one-elf *elf-bags*)

;; Part 2

(defun most-calories-n-elves (n bags)
  (reduce #'+ (sort (mapcar #'calories-in-bag bags) #'>) :end n))

(most-calories-n-elves 1 *elf-bags*)    ; more general solution for part 1
(most-calories-n-elves 3 *elf-bags*)

;; Local Variables:
;; eval: (display-fill-column-indicator-mode)
;; display-fill-column-indicator-column: 100
;; End:
