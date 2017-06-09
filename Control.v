module Control(Opcode, EXOut, MEMOut);
input [3:0] Opcode;
output reg [4:0] EXOut; // ALUOP, MemRead, MemWrite (ALUOP is three bits)
output reg [6:0] MEMOut; // RegWrite, MemToReg, PCtoReg, Jump, JumpMem, BranchN, BranchZ (the datapath has an extra line but doesn't specify what it is)

always @(Opcode)
begin
	case (Opcode)
		4'b0000: begin EXOut <= 5'b01100; MEMOut <= 7'b0000000; end
		4'b1111: begin EXOut <= 5'b11100; MEMOut <= 7'b1010000; end
		4'b1110: begin EXOut <= 5'b11110; MEMOut <= 7'b1100000; end
		4'b0011: begin EXOut <= 5'b11101; MEMOut <= 7'b0000000; end
		4'b0100: begin EXOut <= 5'b10000; MEMOut <= 7'b1000000; end
		4'b0101: begin EXOut <= 5'b01000; MEMOut <= 7'b1000000; end
		4'b0110: begin EXOut <= 5'b00100; MEMOut <= 7'b1000000; end
		4'b0111: begin EXOut <= 5'b00000; MEMOut <= 7'b1000000; end
		4'b1000: begin EXOut <= 5'b01100; MEMOut <= 7'b0001000; end 
		4'b1001: begin EXOut <= 5'b01100; MEMOut <= 7'b0000001; end
		4'b1010: begin EXOut <= 5'b00110; MEMOut <= 7'b0000100; end
		4'b1011: begin EXOut <= 5'b01100; MEMOut <= 7'b0000010; end
	endcase
end
initial begin
    EXOut = 0;
    MEMOut = 0;
end
endmodule