`timescale 1ns/1ps
`default_nettype none

module Decode24 ( out , in ) ;
  input wire [ 1 : 0 ] in;
  output reg [ 3 : 0 ] out ;

  always @(in) // alerted when in changes
    begin
      case(in)
        2'b00: out = 4'b0001;  //when input is 00 output is 0001
        2'b01: out = 4'b0010; //when input is 01 output is 0010
        2'b10: out = 4'b0100; //when input is 10 output is 0100
        2'b11: out = 4'b1000; //when input is 11 output is 1000
      endcase
    end
endmodule
