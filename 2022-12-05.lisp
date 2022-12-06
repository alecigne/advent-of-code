;; TODO Made in a hurry -- refactor me -_-

(in-package :aoc)

(setf *example* '((W P G Z V S B) (F Z C B V J) (C D Z N H M L V)
                  (B J F P Z M D L) (H Q B J G C F V) (B L S T Q F G)
                  (V Z C G L) (G L N) (C H F J)))

(defun command-from-line (line)
  (let ((numbers (remove nil (mapcar #'(lambda (x)
                                         (parse-integer x :junk-allowed t))
                                     (split-sequence:split-sequence " " line :test #'string=)))))
    (list :qty (first numbers) :from (second numbers) :to (third numbers))))

(setf *commands* (load-and-process #P"2022-12-05.txt" :mapper #'command-from-line))

(defun execute-command (command)
  (let ((removal (move (getf command :qty)
                       (get-stack (getf command :from) *example*))))
    (when removal
      (setf (nth (1- (getf command :to)) *example*)
            (append (first removal) (get-stack (getf command :to) *example*)))
      (setf (nth (1- (getf command :from)) *example*)
            (second removal)))))

(defun move (qty stack)
  (when stack
    (let ((pos (if (> qty (length stack)) (length stack) qty)))
      (list (subseq stack 0 pos)
            (subseq stack pos)))))

(defun get-stack (pos boat) (nth (1- pos) boat))

(loop for command in *commands*
      do (execute-command command))
