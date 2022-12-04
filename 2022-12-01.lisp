;;;; 2022-12-01.lisp

(in-package :advent-of-code)

(defvar *bags*
  (load-and-process
   #P"2022-12-01.txt"
   :preprocessor #'(lambda (input) (split-sequence:split-sequence "" input :test #'string=))
   :mapper #'(lambda (bag) (mapcar #'(lambda (calories) (parse-integer calories)) bag))))

(defun calories (bag) (reduce #'+ bag))

(defun most-calories (elves bags)
  (reduce #'+ (sort (mapcar #'calories bags) #'>) :end elves))

(most-calories 1 *bags*)    ; part 1
(most-calories 3 *bags*)    ; part 2
