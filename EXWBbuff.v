module EXWBbuff(clock, iDMEM, iALU, iRd, iI, iWB, iN, iZ, 
oDMEM, oALU, oRd, oI, oWB, oN, oZ);
input clock;
input [31:0]iDMEM, iALU, iI;
input [5:0]iRd;
input [6:0]iWB;
input iN, iZ;

reg [31:0]DMEM, ALU, I;
reg [5:0]Rd;
reg [6:0]WB;
reg N, Z;

output reg [31:0]oDMEM, oALU, oI;
output reg [5:0]oRd;
output reg [6:0]oWB;
output reg oN, oZ;

always @(posedge clock) begin
	oDMEM <= DMEM;
	oALU <= ALU;
	oI <= I;
	oRd <= Rd;
	oWB <= WB;
	oN <= N;
	oZ <= Z;

	DMEM <= iDMEM;
	ALU <= iALU;
	I <= iI;
	Rd <= iRd;
	WB <= iWB;
	N <= iN;
	Z <= iZ;
end
