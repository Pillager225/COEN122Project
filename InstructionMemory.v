// Instruction Memory code by Ryan Cooper
module InstructionMemory(address, clock, dout);
input [31:0]address;
input clock;
output reg [31:0]dout;
reg [31:0] block [255:0]; 
always @(posedge clock) begin
    dout <= block[address];
end
initial begin
    $readmemh("c:/Users/rcooper/project_5/project_5.srcs/sources_1/new/MemoryData/sum.txt", block);
    dout = 0;
end
endmodule