module RegisterFile(write, wdata, rs, rt, rd, clock, rsdata, rtdata);
input write, clock;
input [5:0]rs, rt, rd;
input [31:0]wdata;
output reg [31:0]rsdata, rtdata;
reg [31:0] block [63:0];
always @(posedge clock) begin
    rsdata <= block[rs];
    rtdata <= block[rt];
    if(write == 1)
        block[rd] <= wdata;
end

initial begin
    block[0] = 0;
    block[1] = 1;
    block[2] = 8;
    rsdata = 0;
    rtdata = 0;
end
endmodule