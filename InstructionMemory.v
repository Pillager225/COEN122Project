// Instruction Memory code by Ryan Cooper
module InstructionMemory(address, clock, dout);
input [31:0]address;
input clock;
output reg [31:0]dout;
reg [31:0] block [255:0]; 
always @(posedge clock) begin
    dout <= block[address];
end
//initial begin
//    block[1] = 1;
//    $display ("dirt");
//    dout <= 1;
//end
endmodule