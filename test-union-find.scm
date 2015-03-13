;; larceny -r7rs -path . -program test-union-find.scm

(import (scheme base)
        (scheme write)
        (persistent union-find))

(define (print p) (display p) (newline))

(begin
  (print "testing union-find")
  (let* ((t #f))
    (set! t (create 10))
    (unless (not (= (find t 0) (find t 1)))
            (print "fail 1"))
    (set! t (union t 0 1))
    (unless (= (find t 0) (find t 1))
            (print "fail 2"))
    (unless (not (= (find t 0) (find t 2)))
            (print "fail 3"))
    (set! t (union t 2 3))
    (set! t (union t 0 3))
    (unless (= (find t 1) (find t 2))
            (print "fail 4"))
    (set! t (union t 4 4))
    (unless (not (= (find t 4) (find t 3)))
            (print "fail 5")))
  (print "all tests pass")
  (newline))
