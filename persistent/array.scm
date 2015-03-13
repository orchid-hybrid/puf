;; type 'a t = 'a data ref
;; and 'a data =
;;   | Array of 'a array 
;;   | Diff of int * 'a * 'a t

(define-record-type <diff>
  (diff i v t)
  diff?
  (i diff-index)
  (v diff-value)
  (t diff-cell diff-cell-set!))

(define (parray-allocate size default)
  (box (make-vector size default)))

(define (parray-get t i)
  (let ((k (unbox t)))
    (cond ((vector? k)
           (vector-ref k i))
          ((diff? k)
           (let ((j (diff-index k))
                 (v (diff-value k))
                 (t* (diff-cell k)))
             (if (= i j) v (parray-get t* i))))
          (else (error "get TODO")))))

(define (parray-set t i v)
  (let ((k (unbox t)))
    (cond ((vector? k)
           (let ((old (vector-ref k i)))
             (vector-set! k i v)
             (let ((res (box k)))
               (set-box! t (diff i old res))
               res)))
          ((diff? k)
           (box (diff i v t))))))
