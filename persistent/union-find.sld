(define-library (persistent union-find)

  (import (scheme base)
          (srfi 111)
          (persistent array))

  (export create union find)

  (include "union-find.scm"))
