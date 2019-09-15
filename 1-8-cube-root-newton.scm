;; Same as in square (1.7), the only differnce is improve function

(define (abs x)
  (if (< x 0) (- x) x))

(define (cbrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess)
      guess
      (cbrt-iter guess
                 (improve guess x)
                 x)))

(define (good-enough? prev-guess guess)
  (< (abs (- prev-guess guess)) 0.0001))

(define (cbrt x)
  (cbrt-iter x 1.0 x))

;; -----------------

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
