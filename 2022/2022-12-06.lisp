(in-package :aoc)

(setq *input* (coerce (uiop:read-file-string #P"inputs/2022-12-06.txt") 'list))

(defun no-repetition-p (seq) (equal (remove-duplicates seq) seq))

(defun first-no-repetition (list seq-size &optional (start 1))
  (cond ((< (length list) seq-size) nil)
        ((no-repetition-p (subseq list 0 seq-size)) (+ start (1- seq-size)))
        (t (first-no-repetition (cdr list) seq-size (1+ start)))))

(first-no-repetition *input* 4) ; part 1
(first-no-repetition *input* 14) ; part 2
