(define (f n)
  (if (< n 3) 
      n
      (+ (f (- n 1)) 
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-iter n)
  (define (iter a b c counter)
    (cond ((< n 3) n)
          ((= counter (- n 1)) c)
          (else (iter b 
                      c 
                      (+ c (* 2 b) (* 3 a)) 
                      (+ counter 1)))))
  (iter 0 1 2 1))
