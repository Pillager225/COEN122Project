module IFIDBuff(clock, iInstr, oInstr);
input clock;
input [31:0]iInstr;

reg [31:0]Instr;

output reg [31:0]oInstr;

always @(posedge clock) begin
	oInstr <= Instr;

	Instr <= iInstr;
end
endmodule
