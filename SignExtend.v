module SignExtend(in, out);
input [21:0] in;
output reg [31:0] out;

always @(in) begin
	if (in[21] == 0) begin
		out[31:22] = 10'b0000000000;
	end else begin
		out[31:22] = 10'b1111111111;
	end
	out[21:0] = in;
end
initial begin 
    out = 0;
end
endmodule