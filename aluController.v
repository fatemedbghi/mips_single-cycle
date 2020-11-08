`timescale 1ns/1ns
module aluController (input [5:0]Opcode, input [5:0] Func, input reg Zero,
output reg [2:0]ALUOp, output reg [1:0]PCSrc);
  
  always @(Opcode,Func,Zero) begin
    
    ALUOp = 3'b000;
    PCSrc = 2'b00;
    
    if (Opcode == 6'b000010) begin
      PCSrc = 2'b10;
    end
    
    if (Opcode == 6'b000011) begin
      PCSrc = 2'b10;
    end
    
    if (Opcode == 6'b000100) begin
      ALUOp = 3'b001;
      if(Zero == 1'b1) begin
        PCSrc = 2'b01;
      end
    end
    
    if (Opcode == 6'b000101) begin
      ALUOp = 3'b001;
      if(Zero == 1'b0) begin
        PCSrc = 2'b01;
      end
    end
    
    if (Opcode == 6'b001100) begin
      ALUOp = 3'b010;
    end
    
    if (Opcode == 6'b000000) begin
      
      if (Func == 6'b100010) begin
        ALUOp = 3'b001;
      end
      if (Func == 6'b100100) begin
        ALUOp = 3'b010;
      end
      if (Func == 6'b100101) begin
        ALUOp = 3'b011;
      end
      if (Func == 6'b101010) begin
        ALUOp = 3'b100;
      end
      if (Func == 6'b001000)begin
        PCSrc = 2'b11;
      end
      
    end
      
  end
  
endmodule