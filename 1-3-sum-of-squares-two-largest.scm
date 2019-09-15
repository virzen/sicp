(define (square x) (* x x))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(define (ex-1-3 a b c)
	(cond ((and (< c a) (< c b)) (sum-of-squares a b))
				((and (< b a) (< b c)) (sum-of-squares a c))
				(else (sum-of-squares b c))))
