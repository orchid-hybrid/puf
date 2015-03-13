(define-record-type <puf>
  (puf father c)
  puf?
  (father puf-father puf-set-father!)
  (c puf-c))

(define (create n)
  (puf (parray-init n (lambda (i) i))
       (parray-allocate n 0)))

(define (find h x)
  (define (find-aux f i)
    (let ((fi (parray-get f i)))
      (if (= fi i)
          (values f i)
          (let-values (((f r) (find-aux f fi)))
            (let ((f (parray-set f i r)))
              (values f r))))))
  (let-values (((f cx) (find-aux (puf-father h) x)))
    (puf-set-father! h f)
    cx))

(define (union h x y)
  (let ((rx (find h x))
        (ry (find h y)))
    (if (= rx ry)
        h
        (let ((father (puf-father h))
              (c (puf-c h)))
        (let ((rxc (parray-get c rx))
              (ryc (parray-get c ry)))
          (cond ((> rxc ryc)
                 (puf (parray-set father c ry rx) c))
                ((< rxc ryc)
                 (puf (parray-set father c rx ry) c))
                (else 
                 (puf (parray-set father ry rx)
                      (parray-set c rx (+ rxc 1))))))))))
