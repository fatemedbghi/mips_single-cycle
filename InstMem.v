module instMem(input[31:0] pc, output[31:0] inst);
  reg[31:0] instData[0:2047];
  wire[31:0] secPc;
  assign secPc = {2'b0,pc[31:2]};
  assign inst = instData[secPc];
  initial begin
    $readmemb("inst.txt", instData);
  end
endmodule
