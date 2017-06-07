module Control(Opcode, EXOut, MEMOut);
input [3:0] Opcode;
output reg [4:0] EXOut; // ALUOP, MemRead, MemWrite (ALUOP is three bits)
output reg [6:0] MEMOut; // RegWrite, MemToReg, PCtoReg, Jump, JumpMem, BranchN, BranchZ (the datapath has an extra line but doesn't specify what it is)

always @(Opcode)
begin
	case (Opcode)
		4'b0000: EXOut <= 5'b01100; MEMOut <= 7'b0000000;
		4'b1111: EXOut <= 5'b11100; MEMOut <= 7'b1010000;
		4'b1110: EXOut <= 5'b11110; MEMOut <= 7'b1100000;
		4'b0011: EXOut <= 5'b11101; MEMOut <= 7'b0000000;
		4'b0100: EXOut <= 5'b10000; MEMOut <= 7'b1000000;
		4'b0101: EXOut <= 5'b01000; MEMOut <= 7'b1000000;
		4'b0110: EXOut <= 5'b00100; MEMOut <= 7'b1000000;
		4'b0111: EXOut <= 5'b00000; MEMOut <= 7'b1000000;
		4'b1000: EXOut <= 5'b01100; MEMOut <= 7'b0001000;
		4'b1001: EXOut <= 5'b01100; MEMOut <= 7'b0000001;
		4'b1010: EXOut <= 5'b00110; MEMOut <= 7'b0000100;
		4'b1011: EXOut <= 5'b01100; MEMOut <= 7'b0000010;
	endcase
end
endmodule