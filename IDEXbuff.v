module IDEXbuff(clock, iEX, iMEM, iRD1, iRD2, iRd, iI,
oEX, oMEM, oRD1, oRD2, oRd, oI);
input clock;
input [3:0]iEX;
input [6:0]iMEM;
input [31:0]iRD1, iRD2;
input [5:0]iRd;
input [31:0]iI;

reg [3:0]EX;
reg [6:0]MEM;
reg [31:0]RD1, RD2;
reg [5:0]Rd;
reg [31:0]I;

output reg [3:0]oEX;
output reg [6:0]oMEM;
output reg [31:0]oRD1, oRD2;
output reg [4:0]oRd;
output reg [15:0]oI;

always @(posedge clock) begin
    oEX <= EX;
    oMEM <= MEM;
    oRD1 <= RD1;
    oRD2 <= RD2;
    oRd <= Rd;
    oI <= I;
    
    EX <= iEX;
    MEM <= iMEM;
    RD1 <= iRD1;
    RD2 <= iRD2;
    Rd <= iRd;
    I <= iI;
end

initial begin
    oEX = 0;
    oMEM = 0;
    oRD1 = 0;
    oRD2 = 0;
    oRd = 0;
    oI = 0;
end
endmodule
