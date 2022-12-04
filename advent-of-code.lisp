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

;;;;;;;;;;;;;;;;
;; 2022-12-02 ;;
;;;;;;;;;;;;;;;;

(defun load-strategy (path)
  (let ((input (uiop:read-file-lines path)))
    (mapcar #'(lambda (x) (remove #\Space x)) (uiop:read-file-lines path))))

(defvar *rounds* (load-strategy #P"2022-12-02.txt"))

;; Part 1

(defvar *score-alist*
  '(("AX". 4) ("AY". 8) ("AZ". 3) ("BX". 1) ("BY". 5) ("BZ". 9) ("CX". 7) ("CY". 2) ("CZ". 6)))

(defun get-round-outcome-from-strategy (round strategy)
  (cdr (assoc round strategy :test #'string=)))

(defun get-total-score-from-rounds (rounds strategy)
  (reduce #'+ (mapcar #'(lambda (round) (get-round-outcome-from-strategy round strategy)) rounds)))

(get-total-score-from-rounds *rounds* *score-alist*)

;; Part 2

(defvar *score-alist-bis*
  '(("AX". 3) ("AY". 4) ("AZ". 8) ("BX". 1) ("BY". 5) ("BZ". 9) ("CX". 2) ("CY". 6) ("CZ". 7)))

(get-total-score-from-rounds *rounds* *score-alist-bis*)

;; Local Variables:
;; eval: (display-fill-column-indicator-mode)
;; display-fill-column-indicator-column: 100
;; End:
