`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

                // Here is one example test vector, testing the ADD instruction:
        //ADD  - done
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h2}; #40; passTest({Zero, BusW}, 65'h0ABCD1234, "ADD1", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'hCBCD7A09B01, 4'h2}; #40; passTest({Zero, BusW}, 65'h01C6174D719B3, "ADD2", passed);
		{BusA, BusB, ALUCtrl} = {64'h82C639269B, 64'h152672E37E, 4'h2}; #40; passTest({Zero, BusW}, 65'h097ECAC0A19, "ADD3", passed);


        //OR - done
		{BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'h5A0E7A39, 4'h1}; #40; passTest({Zero, BusW}, 65'h07F0E7B3F, "OR1", passed);
		{BusA, BusB, ALUCtrl} = {64'h9C212C90E109EF50, 64'hAF93053C8CA68455, 4'h1}; #40; passTest({Zero, BusW}, 65'h0BFB32DBCEDAFEF55, "OR2", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'hCBCD7A09B01, 4'h1}; #40; passTest({Zero, BusW}, 65'h0FBCDFB6FFB3, "OR3", passed);
		
        //LSL - done
		{BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'b0001, 4'h3}; #40; passTest({Zero, BusW}, 65'h0FE18967E, "LSL1", passed);
		{BusA, BusB, ALUCtrl} = {64'h82C639269A, 64'b1000, 4'h3}; #40; passTest({Zero, BusW}, 65'h082C639269A00, "LSL2", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'b1000, 4'h3}; #40; passTest({Zero, BusW}, 65'h0FA49D367EB200, "LSL3", passed);
		
        //LSR
		{BusA, BusB, ALUCtrl} = {64'h82C639269A, 64'b1010, 4'h4}; #40; passTest({Zero, BusW}, 65'h020B18E49, "LSR1", passed);
		{BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'b0111, 4'h4}; #40; passTest({Zero, BusW}, 65'h0FE1896, "LSR2", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'b0100, 4'h4}; #40; passTest({Zero, BusW}, 65'h0FA49D367EB, "LSR3", passed);
		
        //SUB
		{BusA, BusB, ALUCtrl} = {64'h82C639269A, 64'h152672E37E, 4'h6}; #40; passTest({Zero, BusW}, 65'h06D9FC6431C, "SUB1", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'hCBCD7A09B01, 4'h6}; #40; passTest({Zero, BusW}, 65'h02E7C595E3B1, "SUB1", passed);
		{BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'h5A0E7A39, 4'h6}; #40; passTest({Zero, BusW}, 65'h024FDD106, "SUB3", passed);


		
        //AND - done
        {BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'h5A0E7A39, 4'h0}; #40; passTest({Zero, BusW}, 65'h05A0C4A39, "AND1", passed);
		{BusA, BusB, ALUCtrl} = {64'h9C212C90E109EF50, 64'hAF93053C8CA68455, 4'h0}; #40; passTest({Zero, BusW}, 65'h08C01041080008450, "AND2", passed);
		{BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'hCBCD7A09B01, 4'h0}; #40; passTest({Zero, BusW}, 65'h0CA495201A00, "AND3", passed);

		
        //PassB -  done
		 {BusA, BusB, ALUCtrl} = {64'h7F0C4B3F, 64'h5A0E7A39, 4'h7}; #40; passTest({Zero, BusW}, {1'b0,64'h5A0E7A39}, "PassB1", passed);
		 {BusA, BusB, ALUCtrl} = {64'h82C639269A, 64'h152672E37E, 4'h7}; #40; passTest({Zero, BusW}, {1'b0,64'h152672E37E}, "PassB2", passed);
		 {BusA, BusB, ALUCtrl} = {64'hFA49D367EB2, 64'h0, 4'h7}; #40; passTest({Zero, BusW}, {1'b1,64'h0}, "PassB3", passed);
	


		allPassed(passed, 21);
	end
      
endmodule

