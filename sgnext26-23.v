module sgnExt26(input[25:0] A, output[31:0] B);
  assign B = {6'b0, A};
endmodule
