;;;; advent-of-code.asd

(asdf:defsystem #:advent-of-code
  :description "My Advent of Code Solutions"
  :author "Anthony Le Cigne <dev@lecigne.net>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "utils")
               (:file "2022-12-01")
               (:file "2022-12-02")
               (:file "2022-12-03")
               (:file "2022-12-04")
               (:file "2022-12-05")
               (:file "2022-12-06")
               )
  :depends-on (#:split-sequence))
