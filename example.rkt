#lang flat-class point%
#:super object%

(init-field x y)

(define/public (move-x dx)
  (set! x (+ x dx)))