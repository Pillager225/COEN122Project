// ALU code by Ryan Cooper
module alu(opcode, A, B, OUT, Z, N);
input [3:0]opcode;
input [31:0]A;
input [31:0]B;
output reg [31:0]OUT;
output reg Z;
output reg N;

always @(opcode or A or B)
begin
    case(opcode)
        4'b0001: OUT <= A+B;
        4'b0111: OUT <= A+(-B);
        4'b0101: OUT <= A+1;
        4'b0110: OUT <=~A;
        default: OUT <= OUT;
    endcase
    if(OUT == 0) 
        begin
            assign Z = 1;
            assign N = 0;
        end
    else 
        begin   
            assign Z = 0;
            if(OUT < 0)
                assign N = 1;
            else
                assign N = 0;
        end
end
initial begin
    OUT = 0;
    Z = 0;
    N = 0;
end
endmodule