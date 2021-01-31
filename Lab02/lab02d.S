.section .text
.globl lab02d

lab02d:
       ADD X0, X0, #1000 //takes argument from the main and adds 1000 to X0
       ADRP X2, myvalue // loads the top 21 bits of myvalue into X2
       ADD X2, X2, :lo12:myvalue // loads last 12 bits of myvalue into X2
       STUR X0, [X2, #0] // stores val from X0 into X2
       ADD X0, X2, XZR  // sets X0 equal to X2
       BR X30

.section .data

myvalue:
.word
