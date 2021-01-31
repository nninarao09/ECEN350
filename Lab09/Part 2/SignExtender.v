module SignExtender(BusImm, Imm26, Ctrl);
	output reg [63:0] BusImm;
	input [25:0] Imm26;
  	input [2:0] Ctrl;
	
  	
  	always@(*)
	  begin
	    if(Ctrl == 3'b000)
	      begin
		BusImm [63:0] = {{52{Imm26[21]}},Imm26[21:10]}; 
	      end
	    if(Ctrl == 3'b001)
	      begin
		BusImm [63:0] = {{55{Imm26[20]}},Imm26[20:12]}; 
	      end
	    if(Ctrl == 3'b010)
	      begin
		BusImm [63:0] = {{38{Imm26[25]}},Imm26[25:0]}; 
	      end
	    if(Ctrl == 3'b011)
	      begin
		BusImm [63:0] = {{45{Imm26[23]}},Imm26[23:5]}; 
	      end
	    if(Ctrl == 3'b100)
	      begin
		 BusImm [63:0] = {{48{1'b0}},{Imm26[20:5]}};
	      end
	    if(Ctrl == 3'b101)
	      begin
		 BusImm [63:0] = {{32{1'b0}},{Imm26[20:5]},{16{1'b0}}};
	      end
	    if(Ctrl == 3'b110)
	      begin
		 BusImm [63:0] = {{16{1'b0}},{Imm26[20:5]},{32{1'b0}}};
	      end
	    if(Ctrl == 3'b111)
	      begin
		 BusImm [63:0] = {{Imm26[20:5]},{48{1'b0}}}; 
	      end
	    
	end
endmodule
