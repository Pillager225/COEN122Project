module ANDGate(in1, in2, out);
input in1, in2;
output reg out;

always @(in1 or in2) begin
	if(in1 == 1 && in2 == 1)
		out <= 1;
	else
		out <= 0;
end
initial begin
    out = 0;
end
endmodule

