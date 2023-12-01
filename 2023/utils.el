(defun file-to-string (file)
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))
