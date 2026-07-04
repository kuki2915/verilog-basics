module basic_4bit_ALU(
   input [3:0] a,
   input [3:0] b,
   input [2:0] opcode,
   output reg [3:0]result,
   output zero);
   
   parameter ADD = 3'b000,
   SUB = 3'b001,
   AND = 3'b010,
   OR = 3'b011,
   XOR = 3'b100,
   NOT = 3'b101,
   sh_left = 3'b110,
   sh_right = 3'b111;
   
   assign zero = ~|result;
   
   always@(*) begin
     case(opcode)
       ADD : result = a + b;
       SUB : result = a + (~b) + 1;
       AND : result = a & b;
       OR : result = a | b;
       XOR : result = a ^ b;
       NOT : result = ~a;
       sh_left : result = a<<1 ;
       sh_right : result = a>>1;
     default: result = 4'b0000;
     endcase
   end
   
 endmodule
     
  
