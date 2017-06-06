module IFIDBuff(clock, iInstr, oInstr, ipc, opc);
input clock;
input [31:0]iInstr, ipc;

reg [31:0]Instr, pc;

output reg [31:0]oInstr, opc;

always @(posedge clock) begin
	oInstr <= Instr;
	opc <= pc;

	Instr <= iInstr;
	pc <= ipc;
end
endmodule
