(in-package :aoc)

(defun undash (input)
  (mapcar #'parse-integer (split-sequence:split-sequence "-" input :test #'string=)))

(defun uncomma (input)
  (split-sequence:split-sequence "," input :test #'string=))

(defun process-line (line) (mapcar #'undash (uncomma line)))

(defvar *data4* (load-and-process #P"inputs/2022-12-04.txt" :mapper #'process-line))

(defun full-overlap-p (couple)
  (destructuring-bind ((min1 max1) (min2 max2)) couple
    (or (and (<= min1 min2) (>= max1 max2))
        (and (<= min2 min1) (>= max2 max1)))))

(defun partial-overlap-p (couple)
  (destructuring-bind ((min1 max1) (min2 max2)) couple
    (or (and (<= min1 min2) (>= max1 min2))
        (and (<= min2 min1) (>= max2 min1)))))

(count-if #'full-overlap-p *data4*)     ; part 1
(count-if #'partial-overlap-p *data4*)  ; part 2
