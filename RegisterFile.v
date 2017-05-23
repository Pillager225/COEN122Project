module RegisterFile(write, wdata, rs, rt, rd, clock, rsdata, rtdata);
input write, clock;
input [5:0]rs, rt, rd;
input [31:0]wdata;
output reg [31:0]rsdata, rtdata;
reg [31:0] block [63:0];
reg i;
always @(posedge clock) begin
    rsdata <= block[rs];
    rtdata <= block[rt];
    if(write == 1)
        block[rd] <= wdata;
end

initial begin
    block[1] = 1;
    block[5] = 5;
    block[6] = 6;
    rsdata <= 1;
    rtdata <= 1;
end
endmodule