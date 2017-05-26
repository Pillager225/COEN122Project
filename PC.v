module PC(clock, in, out);
input clock;
input [31:0]in;

reg [31:0]instr;

output reg [31:0]out;

always @(posedge clock) begin
	out <= instr;
	instr <= in;
end
endmodule
