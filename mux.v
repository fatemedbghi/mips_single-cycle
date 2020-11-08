module RegDstMUX(input RegDst, input [4:0]A, input [4:0]B, output wire [4:0]out);
  assign out = RegDst?B:A;
endmodule

module RegJalMUX(input RegJal, input [4:0]A, output wire [4:0]out);
  assign out = RegJal?(5'b11111):A;
endmodule

module MUX32sel1(input sel, input [31:0]A, input [31:0]B, output wire [31:0]out);
  assign out = sel?B:A;
endmodule

module MUX32sel2(input [1:0]sel, [31:0]A, [31:0]B, [31:0]C, [31:0]D, output wire [31:0]out);
  assign out = sel[1]?(sel[0]?D:C):(sel[0]?B:A);
endmodule