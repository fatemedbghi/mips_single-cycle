module MIPS(input clk, rst);
  wire memtoreg, memwrite, memread, regwrite, dataJal, regJal, regDst, alusrc;
  wire[5:0] cbit, alucbit;
  wire[2:0] aluOp;
  wire[1:0] pcSrc;
  dataPath MIPSdp(clk, rst, memtoreg, memwrite, memread, alusrc, regwrite, regJal, regDst, dataJal, pcSrc, aluOp, cbit, alucbit, zero);
  controller MIPScnt(cbit, regDst, regJal, dataJal, regwrite, memread, memwrite, memtoreg, alusrc);
  aluController ALUcnt(cbit, alucbit, zero, aluOp, pcSrc);
endmodule