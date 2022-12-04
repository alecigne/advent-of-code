;;;; 2022-12-02.lisp
;; TODO Refactor this "quick & dirty" solution

(in-package :advent-of-code)

(defvar *rounds* (load-and-process #P"2022-12-02.txt"
                                   :mapper #'(lambda (line) (remove #\Space line))))

(defparameter *strategy* nil)

(defun get-score (round)
  (cdr (assoc round *strategy* :test #'string=)))

(defun get-total-score (rounds)
  (reduce #'+ (mapcar #'get-score rounds)))

;; Part 1

(let ((*strategy* '(("AX". 4) ("AY". 8) ("AZ". 3)
                    ("BX". 1) ("BY". 5) ("BZ". 9)
                    ("CX". 7) ("CY". 2) ("CZ". 6))))
  (get-total-score *rounds*))

;; Part 2

(let ((*strategy* '(("AX". 3) ("AY". 4) ("AZ". 8)
                    ("BX". 1) ("BY". 5) ("BZ". 9)
                    ("CX". 2) ("CY". 6) ("CZ". 7))))
  (get-total-score *rounds*))
