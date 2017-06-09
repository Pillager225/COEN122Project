module Multiplexer(control1, control2, input0, input1, input2, out);
input control1, control2;
input [31:0] input0, input1, input2;
output reg [31:0] out;

always @(control1 or control2 or input0 or input1 or input2)
begin
	if(control1 == 0)
		begin 
			if(control2 == 0)
				out <= input0;
			else
				out <= input2;
		end 
	else
		begin
			if(control2 == 0)
				out <= input1;
			else
				out <= input2;
		end
end
endmodule