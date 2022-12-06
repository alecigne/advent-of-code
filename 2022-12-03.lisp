(in-package :advent-of-code)

(setf *data* (load-and-process #P"2022-12-03.txt" :mapper #'(lambda (line) (coerce line 'list))))

(defun find-common-items (item-containers)
  (remove-duplicates (reduce #'intersection item-containers)))

(defun find-all-common-items (groups)
  (mapcan #'(lambda (item-containers) (find-common-items item-containers)) groups))

(defun get-item-priority (item)
  (let ((code (char-code item)))
    (if (>= code 97) (- code 96) (- code 38))))

(defun sum-priorities (items)
  (reduce #'+ items :key #'get-item-priority))

;; Part 1

(defun split-seq-in-half (seq)
  (let* ((length (length seq))
         (middle (/ length 2)))
    (list (subseq seq 0 middle) (subseq seq middle length))))

(sum-priorities (find-all-common-items (mapcar #'split-seq-in-half *data*)))

;; Part 2

(sum-priorities
 (find-all-common-items (loop
                          :with length := (length *data*)
                          :for start :from 0 :by 3 :below length
                          :collecting (subseq *data* start (min length (+ start 3))))))
