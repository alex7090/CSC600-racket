#lang racket



;----------------------------------------------------------------;
;  name: sigma.rkt                                               ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the second question for the 3.1 HW          ;
;                                                                ;
;  problem: 2                                                    ;
;                                                                ;
;----------------------------------------------------------------;




(define (square x) (* x x)) ;Function to compute the square of x

(define (sum list) ;This function is used to compute the sum of a list
  (cond
    [(null? list) 0] ;If the list is null/empty, return 0
    [else (+ (car list) (sum (cdr list)))])) ;otherwise we add all the elements to by recursion


(define (sum-of-squares list) ;This function is used to find the sum of the squared values in a list
  (cond
    [(null? list) 0] ;If the list is null/empty we return 0
    [else (+ (square (car list)) (sum-of-squares (cdr list)))])) ;otherwise we square the first element and add the value returned
                                                                 ;by calling the function without the first element


(define sigma (lambda x (
                         sqrt (-                                  ;deviation is defined by the squared root of 
                               (/(sum-of-squares x) (length x))   ;the mean value of the numbers squared (x²)
                               (square (/ (sum x) (length x)))))));and the square of the mean value (x)²

;EXAMPLES
(sigma 1 2 3 2 1)
(sigma 1 3 1 3 1 3)
(sigma 1 3) 
(sigma 1)