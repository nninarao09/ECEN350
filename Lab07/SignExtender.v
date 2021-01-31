 
`timescale 1ns / 1ps
`define STRLEN 8


module SignExtender(BusImm, Imm26, Ctrl); 
  output reg [63:0] BusImm; 
  input [25:0] Imm26; 
  input [1:0]Ctrl; 

  wire extBit; 
  assign #1 extBit = (Ctrl ? 1'b0 : Imm26[25]); 
  //assign BusImm = {{26{extBit}}, Imm26}; 
  
always @(*)begin
	if(Ctrl == 2'b00)
    begin //I
      BusImm = {{52{1'b0}},Imm26[21:10]};
    end
	else if(Ctrl == 2'b01)
    begin // D
      BusImm = {{55{Imm26[20]}}, Imm26[20:12]};
    end
	else if(Ctrl == 2'b10)
    begin // B
      BusImm = {{38{Imm26[25]}}, Imm26};
    end
	else 
    begin// CB
      BusImm = {{45{Imm26[23]}}, Imm26[23:5]};
    end
end


endmodule
