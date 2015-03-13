;; larceny -r7rs -path . -program test-union-find.scm

(import (scheme base)
        (scheme write)
        (persistent union-find))

(define (print p) (display p) (newline))

(begin
  (print "testing union-find")
  (let* ((t #f))
    (set! t (create 10))
    (unless (not (eq? (find t 0) (find t 1)))
            (print "fail 1"))
    (set! t (union t 0 1))
    (unless (eq? (find t 0) (find t 1))
            (print "fail 2"))
    )
  (print "all tests pass")
  (newline))
