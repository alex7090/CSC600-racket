#lang racket


;----------------------------------------------------------------;
;  name: scalar.rkt                                              ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the fifth question for the 3.1 HW           ;
;                                                                ;
;  problem: 5 part A (iterative)                                 ;
;                                                                ;
;----------------------------------------------------------------;



(define (scalar-product a b)
    (cond [(= (vector-length a) (vector-length b))
           (let ((product 0))
             (for ([i (vector-length a)])
                   (set! product (+ product (* (vector-ref a i) (vector-ref b i)))))
            (display product) (display "\n")
             )]
          [else (display "ERROR: Different sizes of vectors\n")]))


(scalar-product '#(1 2 3) '#(2 1 1))
(scalar-product '#(3 3 3) '#(3 3 3))
(scalar-product '#(3 3 3) '#(3 3 4 3))
(scalar-product '#(1 2 4 3) '#(1 2 3 5))