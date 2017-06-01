module Multiplexer(control, input0, input1, input2, out);
input [1:0] control;
input [31:0] input0, input1, input2;
output reg [31:0] out;

always @(control or input0 or input1 or input2)
begin
	case (control)
		2'b00: out <= input0;
		2'b01: out <= input1;
		2'b10: out <= input2;
		2'b11: out <= input2;
	endcase
end
endmodule