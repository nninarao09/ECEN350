        .globl lab04b 

lab04b:
        SUB SP, SP, 16          //make room on the stack
        STUR X30, [SP, 8]       // store x30 where the SP is pointing at
        STUR X1, [SP, 0]        //put current value of X1 into the stack

        CBNZ X0, else          // if X0 is not 0 then it will go to else branch
        ORR X0, XZR, 1         // set x0=1
        
        LDUR X0, [SP, 0]     
        LDUR X30, [SP, 8]
        ADD SP, SP, 16             // return stack pointer by 16 for space
        BR X30                     // return 
        
        
else: 
        ADD X1, X0, XZR            // set X1 = X0
        SUB X0, X0, 1              // subtract 1 from the n value
        BL lab04b                  // branch back to lab04b tag and save nbrahcv tp my_mul in x30
        BL my_mul                  // multiply X1 with X0
        
        LDUR X1, [SP, 0]     //load saved value of X-
        LDUR X30, [SP, 8]    // recover the stack pointer
        ADD SP, SP, 16       // release the stack
        BR X30               // return 

.section   .data
