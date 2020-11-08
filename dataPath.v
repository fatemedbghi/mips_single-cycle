module dataPath(input clk, rst, memtoreg, memwrite, memread, alusrc, regWrite, regJal, regDst, dataJal,
                input[1:0] pcSrc, input[2:0] aluOp, output wire[5:0] cbit,alucbit, output zero);
  wire[31:0] pc, instaddr, writedata, instruction, datamemout, aluout, sgnext16o, aluinput2, memdout, mem2regout, pc4, pcp4, sgnext16oshl2, pcmux1,
             sgnext26o, sgnext26oshl2;
  wire[4:0] readreg1, readreg2, writereg, writeregmux1, writeregmux2;
  wire[31:0] regdata1, regdata2;
  wire[15:0] last16;
  wire[25:0] last26;
  instMem instMemory(instaddr, instruction);
  pcReg pcRegister(clk, rst, pc, instaddr);
  regFile registers(clk, regWrite, readreg1, readreg2, writereg, writedata, regdata1, regdata2);
  RegDstMUX regdstm(regDst, readreg2, writeregmux1, writeregmux2);
  RegJalMUX regjalm(regJal, writeregmux2, writereg);
  MUX32sel1 datajalm(dataJal, mem2regout, pcp4, writedata);
  sgnExt16 sgnext16(last16, sgnext16o);
  alu aLu(regdata1, aluinput2, aluOp, zero, aluout);
  MUX32sel1 aluSRCm(alusrc, regdata2, sgnext16o, aluinput2);
  dataMem dataMemory(aluout, regdata2, memread, memwrite, clk, memdout);
  MUX32sel1 mem2regm(memtoreg, memdout, aluout, mem2regout);
  Adder pc4add(instaddr, pc4, pcp4);
  shl2 se16shl2(sgnext16o, sgnext16oshl2);
  Adder jadd(pcp4, sgnext16oshl2, pcmux1);
  sgnExt26 sgn26(last26, sgnext26o);
  shl2 se26shl2(sgnext26o, sgnext26oshl2);
  MUX32sel2 pcmux(pcSrc, pcp4, pcmux1, sgnext26oshl2, aluout, pc);
  
  assign readreg1 = instruction[25:21];
  assign readreg2 = instruction[20:16];
  assign writeregmux1 = instruction[15:11];
  assign last16 = instruction[15:0];
  assign pc4 = 32'b00000000000000000000000000000100;
  assign last26 = instruction[25:0];
  assign alucbit = instruction[5:0];
  assign cbit = instruction[31:26];
  
  
endmodule
