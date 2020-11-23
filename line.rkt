#lang racket



;----------------------------------------------------------------;
;  name: line.rkt                                                ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the third question for the 3.1 HW           ;
;                                                                ;
;  problem: 3 part A (line) & B (histogram)                      ;
;                                                                ;
;----------------------------------------------------------------;



(define (line i)
  (cond ((= i 0)           ;If i is equal to 0
         (display "\n"))   ;we display a new line and end the program
        (else              ;otherwise
         (display "*")     ;we display a *
         (line (- i 1))))) ;and call the line function for i-1 (recursion)



(define (histogram list)
(unless (null? list) ;unless the list is empty do...
  (line (car list))(histogram (cdr list))))

(line 1)
(line 0)
(line 22)
(line 5)
(display "\n")
(histogram '(1 2 3 3 2 1))