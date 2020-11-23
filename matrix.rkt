#lang racket



;----------------------------------------------------------------;
;  name: matrix.rkt                                              ;
;  author:   Alexandre de Charry                                 ;
;                                                                ;
;  date: 11-21-2020                                              ;
;  description:  This file contains all the code and comments    ;
;                for the sixth question for the 3.1 HW           ;
;                                                                ;
;  problem: 6 part A & B                                         ;
;                                                                ;
;----------------------------------------------------------------;





;Load the matrix from the given file using port
(define (load-matrix filename)
  (let* ((port (open-input-file filename))
         (x (read port))
         (y (read port))
         (matrix (make-vector x)))
    (for ([i x]) ;while i!=x we create a vector, fill it with data from port and then add this row to the matrix
      (let ((row (make-vector y)))
        (for ([j y]) ;This for is used to fill the vector
          (vector-set! row j (read port)))
        (vector-set! matrix i row) ;This adds the row to the matrix
        ))
    (close-input-port port) ;Close the stream
    matrix ;Return the matrix
    ))

;Display a vector as numbers
(define (display-vector vector)
  (for ([i (vector-length vector)]) ;Go through every element in the vector
    (display (vector-ref vector i)) (display " "))) ; Display the said element followed by a space





;Get the row to be displayed
(define (get-row filename i)
  (define matrix (load-matrix filename)) ;Load the matrix
  (vector-ref matrix i)) ;return the element in position i from matrix ( the row we want )


;Display a row
(define (row filename i)
  (set! i (- i 1)); i--
  (display-vector (get-row filename i))) ;Calling the display function with the row
                                         ;we got from the function above


;Get the column to be displayed
(define (get-col filename i)
  (define matrix (load-matrix filename)) ; Load matrix
  (define size (vector-length matrix)) ; Get size of matrix
  (define vector (make-vector size)) ; Create a vector with 'size' elements
  (for ([j size]) ; for j!= size
    (vector-set! vector j (vector-ref (vector-ref matrix j) i))) ; fill the vector with the data from matrix
  vector ; return vector
  )


;Display a column
(define (col filename i)
  (set! i (- i 1)) ;i--
  (display-vector (get-col filename i))) ;Calling the display function with the col
                                         ;we got from the function above



;Compute two vectors
(define (compute a b)
  (let ((sum 0))
    (for ([i (vector-length a)]) 
      (set! sum (+ sum (* (vector-ref a i) (vector-ref b i))))) ;add the sum of two elements from two vectors
    sum));return sum
 


(define (mmul file1 file2 output-file)
  (define matrixA (load-matrix file1)) ;load matrix A
  (define matrixB (load-matrix file2)) ; load matrix B
  (define A-size (vector-length matrixA)) ;get matrix A size
  (define B-size (vector-length matrixB)) ;get matrix B size
  (define output (open-output-file output-file)) ;Create output stream
  (display A-size output) ;write matrix size to file
  (display " " output)
  (display B-size output) ;write matrix size to file
  (newline output)
  (for ([i A-size]) ;While i != size of matrix A
    (let ((row (make-vector B-size))) ; create a new row
      (for ([j B-size]) ; this for will fill the row and write it into the output stream
        (vector-set! row j (compute (get-row file1 i) (get-col file2 j))) ;computing & filling
        (display (vector-ref row j) output) ;displaying in file
        (display " " output)
      )
      (display-vector row) (newline) (newline output)));display row in terminal
  (close-output-port output) (display "") ;close output stream
  )



;tests;
(col "matrix2.dat" 2)
(display"\n")
(row "matrix2.dat" 2)
(display"\n")
(mmul "matrix1.dat" "matrix2.dat" "matrix3.dat")
(display"\n")
(col "matrix3.dat" 2)
(display"\n")
(row "matrix3.dat" 2)
