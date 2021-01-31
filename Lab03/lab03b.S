.globl lab03b

lab03b:     
    ADRP X2, UIN                  // put the memolry address of UIN into X2
    ADD X2, X2, :lo12:UIN
    
    ORR X3, XZR, XZR             // make X3 = 0 so I can use it as my counter in the loop
    LDUR X0, [X2, #0]            // Load X2 into X0
    

loop: SUB X1, X3, #10       // check if x1 = x3-10 so that if it equals 0 then it has iterated through the loop 10 times
	CBZ X1, Exit            // if X1 == 0 go to the end section
    SUB X0, X0, #1     // subtract 1 from the UIN
    ADD X3, X3, #1     // this is the counter for the loop, once X3 is 10, the program shoud go to the end section
    B loop

Exit:     
    STUR X0, [X2, 0]     // store X0 into X2 this is the updated digit 
    BR X30               // return to the main

.section .data

UIN:
.word 38 // 7+2+7+0+0+1+4+8+9
