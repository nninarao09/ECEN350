
`timescale 1ns / 1ps
`define STRLEN 32
module NextPClogicTest();

	task passTest;
		input [63:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [3:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [3:0] passed;
		input [3:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [63:0] CurrentPC, SignExtImm64;
	reg Branch, ALUZero, Uncondbranch;
	reg [3:0] passed;

	// Outputs
	wire [63:0] NextPC;
	reg [63:0] newNextPC;


   initial //This initial block used to dump all wire/reg values to dump file
     begin
       $dumpfile("NextPClogicTest.vcd");
       $dumpvars(0,NextPClogicTest);
     end
     
	// Instantiate the Unit Under Test (UUT)
	NextPClogic uut (
		.CurrentPC(CurrentPC), 
		.SignExtImm64(SignExtImm64), 
		.Branch(Branch), 
		.ALUZero(ALUZero), 
		.Uncondbranch(Uncondbranch),
		.NextPC(NextPC)
	);

	initial begin
		// Initialize Inputs
		CurrentPC = 0; SignExtImm64 = 0; Branch = 0; ALUZero = 0; Uncondbranch = 0; passed = 0;
		#3;
		
		//test 1
		CurrentPC = 10; SignExtImm64 = 20;
		Branch = 0; ALUZero = 0; Uncondbranch = 1; newNextPC = 90;
		#10; passTest(NextPC, newNextPC, "Test 1", passed);
		
		// test 2
		CurrentPC = 16; SignExtImm64 = 2;
		Branch = 1; ALUZero = 1;  Uncondbranch = 0; newNextPC = 24;
		#10; passTest(NextPC, newNextPC, "Test 2", passed);
		
		//test 3
		CurrentPC = 16; SignExtImm64 = 3;
		Branch = 1; ALUZero = 0; Uncondbranch = 0; newNextPC = 20;
		#10; passTest(NextPC, newNextPC, "Test 3", passed);
		
		//test 4
		CurrentPC = 16; SignExtImm64 = 4;
		Branch = 0; ALUZero = 0; Uncondbranch = 1; newNextPC = 32;
		#10; passTest(NextPC, newNextPC, "Test 4", passed);

		allPassed(passed, 4);
		
	end
      
endmodule

