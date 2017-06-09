module Adder(In1, In2, Out);
input [31:0] In1, In2;
output reg [31:0] Out;

always @(In1 or In2)
begin
	Out <= In1 + In2;
end
initial begin
    Out <= 0;
end
endmodule