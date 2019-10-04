; One difference between recursive-process and iterative-process versions seems
; to be that recursive-process one seems start from the top, so "here is the
; expression that gives the final result", whereas iterative-process start at the
; first known, defined value and builds the final expression from that.
;
; I found the iterative-process approach to include a concept of a "tail" (not 
; sure if related to tail recursion). In each iteration we calcuate another value 
; that gets us closer to the result and we _keep previous values_ that will be yet 
; necessary. In this particular example, in each iteration we need three previous 
; results, so we have 3 state variables for that. With Fibonacci, we used two of the
; the previous ones, so kept two of them. In factorial—one. 
;
; However, the fact that formula references some variables is not the deciding factor.
; If in this exercise it only referenced f(n - 1) and f(n - 3), we would still need to
; keep three variables. That's because what is f(n - 2) in one iteration, becomes f(n - 3)
; on another, and so we also need to keep track of f(n - 2). This seems to imply that 
; the tail must include all the results _up to_ the last result we're gonna need in each 
; iteration.

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
