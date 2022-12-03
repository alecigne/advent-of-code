;;;; advent-of-code.asd

(asdf:defsystem #:advent-of-code
  :description "My Advent of Code Solutions"
  :author "Anthony Le Cigne <dev@lecigne.net>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "advent-of-code"))
  :depends-on (#:split-sequence))
