module pcReg(input clk, rst, input[31:0] pc, output reg[31:0] instadd);
  always@(posedge clk, posedge rst)begin
    if(rst) instadd <= 32'b0;
    else instadd <= pc;
    end
endmodule
