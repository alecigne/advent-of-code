(in-package :advent-of-code)

(defun load-and-process (filepath &key preprocessor mapper)
  "Load and process file at FILEPATH using a PREPROCESSOR called on the
entire input, and a MAPPER on individual lines."
  (let* ((input (uiop:read-file-lines filepath))
         (processed-input (if preprocessor (funcall preprocessor input) input)))
    (if mapper (mapcar mapper processed-input) processed-input)))
