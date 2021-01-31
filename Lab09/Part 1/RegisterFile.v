module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RW, RA, RB;
    input RegWr;
    input Clk;
    
    
    reg [63:0] registers [31:0];
    
    initial begin
        registers[31] = 0;
    end
     
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
     
    always @ (negedge Clk) 
      begin
        if(RegWr)
            if(RegWr != 31)
                registers[RW] <= #3 BusW;
            registers[31] <= #3 0;
      end
endmodule
