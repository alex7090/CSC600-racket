#lang racket



;----------------------------------------------------------------;
;  name: find-max.rkt                                            ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the fourth question for the 3.1 HW          ;
;                                                                ;
;  problem: 4 (Trisection)                                       ;
;                                                                ;
;----------------------------------------------------------------;



(define (findmax X Y f)  
  (let* ((tri (/ (- Y X) 3.)) ;declaring/updating the variables
         (x (+ X tri))
         (y (- Y tri)))
    (cond [(< (abs (- (f X) (f Y))) .0000001) ;If the precision is 0.000001 we stop and display the result
           (display(/ (+ Y X) 2.)) (display "\n")]
          [(> (f x) (f y)) ; else we use recursion to keep going. Values depending on value of f()
           (findmax X y f)]
          [else (findmax x Y f)])))

   

(findmax -2 2 (lambda (X) (+ (- (* 3 X)) 2)))
(findmax -5 10 (lambda (X) (- (- (* 3 X)) X)))