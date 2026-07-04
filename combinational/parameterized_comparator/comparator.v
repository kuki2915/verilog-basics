module comparator #(parameter width = 8)(
  input [width-1 : 0] a,
  input [width-1: 0] b,
  output a_gt_b,
  output a_lt_b,
  output a_eq_b);
  
  assign a_eq_b = &(~(a ^ b));// Equality: bitwise XNOR then AND reduction
  
  assign a_gt_b = (a > b);
  assign a_lt_b = (a < b);
endmodule
