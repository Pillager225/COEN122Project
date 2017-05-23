module IDEXbuff(clock, iEX, iM, iWB, iRD1, iRD2, iRd, iRt, iI,
oEX, oM, oWB, oRD1, oRD2, oRd, oRt, oI);
input clock;
input [3:0]iEX;
input [2:0]iM;
input [1:0]iWB;
input [31:0]iRD1, iRD2;
input [4:0]iRd, iRt;
input [15:0]iI;

reg [3:0]EX;
reg [2:0]M;
reg [1:0]WB;
reg [31:0]RD1, RD2;
reg [4:0]Rd, Rt;
reg [15:0]I;

output reg [3:0]oEX;
output reg [2:0]oM;
output reg [1:0]oWB;
output reg [31:0]oRD1, oRD2;
output reg [4:0]oRd, oRt;
output reg [15:0]oI;

always @(posedge clock) begin
    oEX <= EX;
    oM <= M;
    oWB <= WB;
    oRD1 <= RD1;
    oRD2 <= RD2;
    oRd <= Rd;
    oRt <= Rt;
    oI <= I;
    
    EX <= iEX;
    M <= iM;
    WB <= iWB;
    RD1 <= iRD1;
    RD2 <= iRD2;
    Rd <= iRd;
    Rt <= iRt;
    I <= iI;
end
endmodule
