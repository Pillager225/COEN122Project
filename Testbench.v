module Testbench();

reg clock;

// pc vars
reg [31:0]pcmuxOut, pcOut, one, pcAdderOut;
// Instruction Memory vars
reg [31:0]imemOut;
// sign extender vars
reg [31:0]signExtenderOut;
// IFID buff vars out
reg [31:0]ifidPC, ifidInstr;
// iAdder vars
reg [31:0]iAdderOut;
// Control vars out
reg [4:0]controlEX, controlMEM;
// RegisterFile vars out
reg [31:0]regfileRD1, regfileRD2;
// IDEX buff vars out
reg [31:0]idexRD1, idexRD2, idexI, idexRd;
// Data memory vars out
reg [31:0]dmemOut;
// ALU vars out
reg [31:0]aluOut;
reg aluZ, aluN;
// EXWB buff vars out
reg [31:0]exwbDMEM, exwbALU, exwbI;
reg exwbZ, exwbN;
// wb mux vars out
reg [31:0]wbmuxOut;
// logic gate vars out
reg bzANDOut, bnANDOut, orOut;

// IF stage
Multiplexer #() pcmux (
	.control1(orOut),
	.control2( ),
	.input0(pcAdderOut),
	.input1(exwbALU),
	.input2(exwbDMEM),
	.out(pcmuxOut)
);

PC #() pc (
	.clock(clock),
	.in(pcmuxOut),
	.out(pcOut)
);

Adder #() pcAdder (
	.In1(pcOut),
	.In2(one),
	.Out(pcAdderOut)
);

InstructionMemory #() im (
	.address(pcOut),
	.clock(clock),
	.dout(imemOut)
);

IFIDBuff #() ifidbuff (
	.clock(clock),
	.iInstr(imemOut),
	.oInstr(ifidInstr),
	.ipc(pcOut),
	.opc(ifidPC)
);

// ID stage
RegisterFile #() regFile ( 
	.write( ),
	.wdata(wbmuxOut),
	.rs(ifidInstr[27:22]),
	.rt(ifidInstr[21:16]),
	.rd(ifidInstr[15:10]),
	.clock(clock),
	.rsdata(regfileRD1),
	.rtdata(regfileRD2)
);

Control #() control (
	.Opcode(ifidInstr[31:28]),
	.EXOut(controlEX),
	.MEMOut(controlMEM)
);

SignExtend #() signextender (
	.in(ifidInstr[21:0]),
	.out(signExtenderOut)
);

Adder #() iAdder (
	.In1(signExtenderOut),
	.In2(ifidPC),
	.Out(iAdderOut)
);

IDEXbuff #() idexbuff ( 
	.clock(clock),
	.iEX(controlEX),
	.iMEM(controlMEM),
	.iRD1(regfileRD1),
	.iRD2(regfileRD2),
	.iRd( ),
	.iI( ),
	.oEX( ),
	.oMEM( ),
	.oRD1(idexRD1),
	.oRD2(idexRD2),
	.oRd(idexRd),
	.oI(idexI)
);

// EX stage
DataMemory #() dmem (
	.clock(clock),
	.write( ),
	.daddress(idexRD1), // TODO ensure these are the right places for the RDs to go
	.din(idexRD2), // TODO is RD2 actually the input data and RD1 the daddress
	.dout(dmemOut)
);

alu #() ALU ( // TODO verify opcodes in alu file
	.opcode( ),
	.A(idexRD1),
	.B(idexRD2),
	.OUT(aluOut),
	.Z(aluZ),
	.N(aluN)
);

EXWBbuff #() exwbbuff (
	.clock(clock),
	.iDMEM(dmemOut),
	.iALU(aluOut),
	.iRd(idexRd),
	.iI(idexI),
	.iWB( ),
	.iN(aluN),
	.iZ(aluZ),
	.oDMEM(exwbDMEM),
	.oALU(exwbALU),
	.oRd( ),
	.oI(exwbI),
	.oWB( ),
	.oN(exwbN),
	.oZ(exwbZ)
);

// WB stage
Multiplexer #() wbmux (
	.control1( ),
	.control2( ),
	.input0(exwbALU),
	.input1(exwbDMEM),
	.input2(exwbI),
	.out(wbmuxOut)
);

ANDGate #() bzAND (
	.in1(exwbZ),
	.in2( ),
	.out(bzANDOut)
);

ANDGate #() bnAND (
	.in1(exwbN),
	.in2( ),
	.out(bzANDOut)
);

ORGate #() orGate (
	.in1(bzANDOut),
	.in2(bnANDOut),
	.in3( ),
	.out(orOut),
);

initial begin
	one = 1;
end