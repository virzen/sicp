(define (f n)
  (if (< n 3) 
      n
      (+ (f (- n 1)) 
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; using lexical scope not to have to pass n around
(define (f n)
  (define (iter a b c counter)
    (cond ((< n 3) n)
          ((= counter (- n 1)) c)
          (else (iter b 
                      c 
                      (+ c (* 2 b) (* 3 a)) 
                      (+ counter 1)))))
  (iter 0 1 2 1))

; without lexical scoping
(define (f n) (iter 0 1 2 1 n))

(define (iter a b c counter n)
  (cond ((< n 3) n)
        ((= counter (- n 1)) c)
        (else (iter b 
                    c 
                    (+ c (* 2 b) (* 3 a)) 
                    (+ counter 1)
                    n))))
