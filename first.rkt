#lang racket

;----------------------------------------------------------------;
;  name: first.rkt                                               ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the first question for the 3.1 HW           ;
;                                                                ;
;  problem: 1 -> A through G                                     ;
;                                                                ;
;----------------------------------------------------------------;




; QUESTION 1 PART A ;
(display "1.a output :\n")
;The below function (lambda) is an example of an anonymous function
;An anonymous function doesn't use the usual define keyword
;In this case, lambda takes a number and multiply it by itself.
;In our case it is 5 so the result should be 25
((lambda(n) ( * n n)) 5)






; QUESTION 1 PART B ;
(display "\n1.b output :\n")
;A first class object can also be stored in a function
;Following the previous question, let us create this function:
(define (squared n) (* n n))
;We used the keyword define, followed by (fctn_name arg) (action)
;We can call this function like this :
(squared 5)




; QUESTION 1 PART C ;
(display "\n1.c output :\n")
;Here, we define a list named A, to wich we add the squared function as element;
(define A (list squared))
;The car keyword is used to access the first element of a list.
;In our case we only have one element and it should be the squared function
;This will call squared with 6 as parameter (see 1.c output)
((car A) 6)




; QUESTION 1 PART D ;
(display "\n1.d output :\n")
;One of the basic comparisons is the equal keyword
;This first example should return false as it compare two different things
(equal? + -)
;This example compare the squared function and the function in the first
;position of the A list ( squared aswell! )
(equal? squared (car A))
;Here we compare two list twice. One should be true and the other false
(equal? '(1 2 3 4) '(1 2 3 4))
(equal? '(2 1 3 4) '(1 2 3 4))




; QUESTION 1 PART E ;
(display "\n1.e output :\n")
;For this question, let us use the squared function from 1.b
;Here, we pass (squared 5) as an argument for squared
;This will first compute the square of 5 (25), before
;computing squared again with 25 for the expected 625 result
(squared (squared 5))



; QUESTION 1 PART F ;
(display "\n1.f output :\n")
;Let us create a function that will square a number only if it a negative
;At the third line we can see we call the squared function as a return value
(define (square_if_negative n)
  (cond ((< n 0)          
         (squared n))  
        (else
         n
         )))
;Here we call the new function with -5 as argument
(square_if_negative -5)





; QUESTION 1 PART G ;
(display "\n1.g output :\n")
;With the require keyword, we can import functions from another file
;The tmp file has the double function defined as : (define (double n ) (+ n n))
(require "tmp.rkt")
(double 5)

;If we display the squared function it will tell us the type of data
;As expected, in our case, it is a procedure
(display squared)
(display "\n")

;The read keyword allows the user to input data
;For our example, we will input a function
(read)