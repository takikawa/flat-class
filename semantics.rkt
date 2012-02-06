#lang racket

(require (for-syntax syntax/parse))

(provide (except-out (all-from-out racket) #%module-begin)
         (rename-out [-#%module-begin #%module-begin]))

(define-syntax (-#%module-begin stx)
  (syntax-parse stx
    [(_ cls:id
        (~optional (~seq #:super super-class:expr)
                   #:defaults ([super-class #'object%]))
        body ...)
     #'(#%module-begin
        (require racket/class)
        (provide cls)
        (define cls
          (class super-class
            body ...)))]))