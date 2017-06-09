module DataMemory(clock, write, read, daddress, din, dout);
input clock, write, read;
input [31:0]daddress, din;
output reg [31:0]dout;
reg [31:0] block [9:0];
always @(negedge clock) begin
    if(write == 1)
        begin
            block[daddress] <= din;
            dout <= 0;
        end
    else
		begin
			if(read == 1) 
				dout <= block[daddress];
			else
				dout <= 0;
		end
end

initial begin
    $readmemh("c:/Users/rcooper/project_5/project_5.srcs/sources_1/new/MemoryData/Dmem1.txt", block);
    dout = 0;
end
endmodule