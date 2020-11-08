`timescale 1ns/1ns
module controller(input [5:0]Opcode, output reg RegDst, RegJal, DataJal, RegWrite, MemRead, MemWrite, MemToReg, ALUSrc);
 
  always @(Opcode) begin
   
    {RegDst, RegJal, DataJal, RegWrite, MemRead, MemWrite, MemToReg, ALUSrc} = 8'b0;
  
    if (Opcode == 6'b000000) begin
      RegWrite = 1'b1;
      RegDst = 1'b1;
      MemToReg = 1'b1;
    end
    
    if (Opcode == 6'b001000) begin
      RegWrite = 1'b1;
      ALUSrc = 1'b1;
      MemToReg = 1'b1;
    end
    
    if (Opcode == 6'b001100) begin
      RegWrite = 1'b1;
      ALUSrc = 1'b1;
      MemToReg = 1'b1;
    end
    
    if (Opcode == 6'b100011) begin
      RegWrite = 1'b1;
      ALUSrc = 1'b1;
      MemRead = 1'b1;  
    end
    
    if (Opcode == 6'b101011) begin
      ALUSrc = 1'b1;
      MemWrite = 1'b1;
    end
    
    if (Opcode == 6'b000011) begin
      RegWrite = 1'b1;
      RegJal = 1'b1;
      DataJal = 1'b1;
    end  
    
  end
 
endmodule 