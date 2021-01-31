
module Mux21 ( out , in , sel ) ;
  input [ 1 : 0 ] in ; // 2bit input
  input sel ;
  output out ;
  
  wire S1, S2, S3;  // delcaring the wires
  
  not not1(S1, sel);    // the S1 value is the not of the sel
  
  and and1(S2, in[0], S1); // S2 wire is th and with input 0 and S1
  and and2(S3, in[1], sel);  // the S3 wire is the and with input 1 and sel
  
  or or1(out, S2, S3);  // or with S2 and S3
 
endmodule
