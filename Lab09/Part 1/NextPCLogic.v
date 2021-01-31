module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
      	input [63:0] CurrentPC, SignExtImm64; 
      	input Branch, ALUZero, Uncondbranch; 
      	output reg [63:0] NextPC; 
        reg [63:0] temp;

       always@ (*)	
        begin
          temp = SignExtImm64 << 2;
          if(Uncondbranch | (Branch & ALUZero))				
           	NextPC = #3 CurrentPC + temp;							
          else
           	NextPC = #2 CurrentPC + 4;									
        end
endmodule
