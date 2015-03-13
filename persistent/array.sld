(define-library (persistent array)

  (import (scheme base)
          (srfi 111))

  (export parray-allocate
          parray-reroot
          parray-get
          parray-set)

  (include "array.scm"))

;; https://www.lri.fr/~filliatr/puf/

;; module type PersistentArray = sig
;;   type 'a t
;;   val init : int -> (int -> 'a) -> 'a t
;;   val get : 'a t -> int -> 'a
;;   val set : 'a t -> int -> 'a -> 'a t
;; end
