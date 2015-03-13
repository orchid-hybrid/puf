;; larceny -r7rs -path . -program test-parray.scm

(import (scheme base)
        (scheme write)
        (persistent array))

(define (print p) (display p) (newline))

(begin
  (print "testing parray")
  (let* ((a1 (parray-allocate 10 'o))
         (a2 #f))
    (unless (eq? 'o (parray-get a1 0))
            (print "fail 1"))
    (unless (eq? 'o (parray-get a1 1))
            (print "fail 2"))
    (set! a2 (parray-set a1 0 'x))
    (unless (eq? 'o (parray-get a1 0))
            (print "fail 3"))
    (unless (eq? 'o (parray-get a1 1))
            (print "fail 4"))
    (unless (eq? 'x (parray-get a2 0))
            (print "fail 5"))
    (print (parray-freeze a1))
    (print (parray-freeze a2)))
  (print "all tests pass")
  (newline))
