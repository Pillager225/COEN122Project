module ORGate(in1, in2, in3, out);
input in1, in2, in3;

output reg out;

always @(in1 or in2 or in3) begin
	if(in1 == 1 || in2 == 1 || in3 == 1)
		out <= 1;
	else
		out <= 0;
end
initial begin
    out = 0;
end
endmodule
