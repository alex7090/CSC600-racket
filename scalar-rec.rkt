#lang racket



;----------------------------------------------------------------;
;  name: scalar-rec.rkt                                          ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the fifth question for the 3.1 HW           ;
;                                                                ;
;  problem: 5 part B (recursive)                                 ;
;                                                                ;
;----------------------------------------------------------------;



(define (scalar-product a b)
  (cond [(= (vector-length a) (vector-length b))
         (let* (
                (x (vector->list a))
                (y (vector->list b)))
          (cond ((null? (cdr x)) (* (car x) (car y)))
                (else (+ (* (car x) (car y)) (scalar-product (list->vector (cdr x)) (list->vector (cdr y)))))))]
          [else (display "ERROR: Different sizes of vectors!\n")])
      )

(scalar-product '#(1 2 3) '#(2 1 1))
(scalar-product '#(3 3 3) '#(3 3 3))
(scalar-product '#(3 3 3) '#(3 3 4 3))
(scalar-product '#(1 2 4 3) '#(1 2 3 5))