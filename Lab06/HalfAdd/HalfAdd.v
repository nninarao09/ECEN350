
module HalfAdd ( Cout , Sum , A, B ) ;
  input A, B ;
  output Cout , Sum ;
  
  wire S1, S2, S3;
  
  nand nand1(S3, A, B); // S3 =  not(AB)
  nand nand2(S1, A, S3); // S1 = A nand not(AB)
  nand nand3(S2, S3, B); // S2 = B nand not(AB)
  nand nand4(Sum, S1, S2); // Sum = S1 and S2 = A XOR B
  
  nand nand5(Cout, S3, S3); // Cout = AB
  

endmodule
