#lang racket

(define (≈ a b [tolerance 1e-9])
  (<= (abs (/ (- a b) (max a b))) tolerance))

(define all-tests
  `(([100000000000000.01 100000000000000.011]
     [100.01 100.011]
     [,(/ 10000000000000.001 10000.0) 1000000000.0000001000]
     [0.001 0.0010000001]
     [0.000000000000000000000101 0.0]
     [,(* (sqrt 2) (sqrt 2)) 2.0]
     [,(* (- (sqrt 2)) (sqrt 2)) -2.0]
     [100000000000000003.0 100000000000000004.0]
     [3.14159265358979323846 3.14159265358979324])
    ([#e100000000000000.01 #e100000000000000.011]
     [#e100.01 #e100.011]
     [,(/ #e10000000000000.001 #e10000.0) #e1000000000.0000001000]
     [#e0.001 #e0.0010000001]
     [#e0.000000000000000000000101 #e0.0]
     [,(* (sqrt 2) (sqrt 2)) #e2.0]
     [,(* (- (sqrt 2)) (sqrt 2)) #e-2.0]
     [100000000000000003 100000000000000004]
     [#e3.14159265358979323846 #e3.14159265358979324])))

(define (format-num x)
  (~a (~r x #:precision 30) #:min-width 50 #:align 'right))

(for ([tests (in-list all-tests)] [name '("inexact" "exact")])
  (printf "~a:\n" name)
  (for ([test (in-list tests)])
    (match-define (list a b) test)
    (printf "~a ~a: ~a\n" (format-num a) (format-num b) (≈ a b)))
  (newline))