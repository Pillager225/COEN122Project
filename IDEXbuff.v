module IDEXbuff(clock, iEX, iMEM, iWB, iRD1, iRD2, iRd, iI,
oEX, oM, oWB, oRD1, oRD2, oRd, oI);
input clock;
input [3:0]iEX;
input [2:0]iMEM;
input [6:0]iWB;
input [31:0]iRD1, iRD2;
input [5:0]iRd;
input [31:0]iI;

reg [3:0]EX;
reg [2:0]MEM;
reg [6:0]WB;
reg [31:0]RD1, RD2;
reg [5:0]Rd;
reg [31:0]I;

output reg [3:0]oEX;
output reg [2:0]oMEM;
output reg [1:0]oWB;
output reg [31:0]oRD1, oRD2;
output reg [4:0]oRd;
output reg [15:0]oI;

always @(posedge clock) begin
    oEX <= EX;
    oMEM <= MEM;
    oWB <= WB;
    oRD1 <= RD1;
    oRD2 <= RD2;
    oRd <= Rd;
    oI <= I;
    
    EX <= iEX;
    MEM <= iMEM;
    WB <= iWB;
    RD1 <= iRD1;
    RD2 <= iRD2;
    Rd <= iRd;
    I <= iI;
end
endmodule
