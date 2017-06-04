module Control(Opcode, EXOut, MEMOut);
input [3:0] Opcode;
output reg [4:0] EXOut; // ALUOP, MemRead, MemWrite (ALUOP is three bits)
output reg [4:0] MEMOut; // RegWrite, MemToReg, PCtoReg, Branch, Jump (the datapath has an extra line but doesn't specify what it is)

always @(Opcode)
begin
	case (Opcode)
		5'b0000: EXOut <= 5'b01100; MEMOut <= 5'b00000;
		5'b1111: EXOut <= 5'b11100; MEMOut <= 5'b10100;
		5'b1110: EXOut <= 5'b11110; MEMOut <= 5'b11000;
		5'b0011: EXOut <= 5'b11101; MEMOut <= 5'b00000;
		5'b0100: EXOut <= 5'b10000; MEMOut <= 5'b10000;
		5'b0101: EXOut <= 5'b01000; MEMOut <= 5'b10000;
		5'b0110: EXOut <= 5'b00100; MEMOut <= 5'b10000;
		5'b0111: EXOut <= 5'b00000; MEMOut <= 5'b10000;
		5'b1000: EXOut <= 5'b01100; MEMOut <= 5'b00001;
		5'b1001: EXOut <= 5'b01100; MEMOut <= 5'b00010;
		5'b1010: EXOut <= 5'b00110; MEMOut <= 5'b00001;
		5'b1011: EXOut <= 5'b01100; MEMOut <= 5'b00010;
	endcase
end
endmodule