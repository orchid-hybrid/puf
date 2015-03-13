(define-record-type <puf>
  (puf father c)
  puf?
  (father puf-father puf-set-father!)
  (c puf-c))

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
