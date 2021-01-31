.globl lab03c

lab03c:     
    ADRP X2, UIN                // put the address of UIN into X2
    ADD X2, X2, :lo12:UIN
    
    ADRP X5, my_array            // put the address of my_array into X5
    ADD X5, X5, :lo12:my_array
    
    ORR X3, XZR, XZR           // X3=0 for the conunter
    LDUR X0, [X2, #0]         // load x2 UIN value into X0  
    

loop: 	SUB X1, X3, #10   // X1 = X3-10 
	CBZ X1, Exit       // if X1 ==0 go to end section
	STUR X0, [X5, 0]  // otherwise store X0 into X5
	ADD X5, X5, #4    // Add 4 to the my_address array because any word is located 4 byts away
    ADD X0, X0, #1    // add 1 to mu uin
    
    ADD X3, X3, #1    // counter goes up by one
       
    B loop

Exit:     
    BR X30                // return to the main

.section .data

UIN:
.word 7 // 7+2+7+0+0+1+4+8+9

my_array:
.space 40 //enough for 10 words as each word is 4 bytes

