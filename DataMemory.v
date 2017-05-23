module DataMemory(clock, write, daddress, din, dout);
input clock, write;
input [31:0]daddress, din;
output reg [31:0]dout;
reg [31:0] block [1023:0];
always @(negedge clock) begin
    if(write == 1)
        begin
            block[daddress] <= din;
            dout <= 0;
        end
    else
        dout <= block[daddress];
end

initial begin
    block[1] = 1;
    block[6] = 6;
    dout <= 1;
end
endmodule