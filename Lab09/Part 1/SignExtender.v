module SignExtender(BusImm, Imm26, Ctrl);
	output reg [63:0] BusImm;
	input [25:0] Imm26;
  	input [1:0] Ctrl;
	
  
  	always@(*)
	  begin
	    if(Ctrl == 2'b00)
	      begin
		BusImm [63:0] = {{52{Imm26[21]}},Imm26[21:10]}; //i type
	      end
	    if(Ctrl == 2'b01)
	      begin
		BusImm [63:0] = {{55{Imm26[20]}},Imm26[20:12]}; //d type
	      end
	    if(Ctrl == 2'b10)
	      begin
		BusImm [63:0] = {{38{Imm26[25]}},Imm26[25:0]}; //b type
	      end
	    if(Ctrl == 2'b11)
	      begin
		BusImm [63:0] = {{45{Imm26[23]}},Imm26[23:5]}; //cb type
	      end

	end
endmodule
