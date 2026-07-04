module tb_comparator;
  reg [7:0] a, b;
    wire a_eq_b, a_gt_b, a_lt_b;
  
  comparator #(8) dut(
    .a(a), .b(b), .a_gt_b(a_gt_b), .a_eq_b(a_eq_b), .a_lt_b(a_lt_b));
  
  task check;
    input exp_gt;
    input exp_lt;
    input exp_eq;
    
      begin
      #5; 
        if( a_eq_b !== exp_eq || a_gt_b !== exp_gt || a_lt_b !== exp_lt)
       
       $error("test failed for a= %b b= %b | got gt= %b lt= %b eq= %b | expected gt= %b lt= %b eq =%b", a,b,a_gt_b, a_lt_b, a_eq_b, exp_gt, exp_lt, exp_eq);
        
      else 
        $display ("test passed for a= %b and b=%b",a,b);
      
    end
  endtask
  
  initial begin
    a= 8'b10110100;
    b= 8'b10110101;
    check (0,1,0);
    
    a= 8'b10110110;
    b= 8'b10110101;
    check (1,0,0);
    
    a= 8'b10110100;
    b= 8'b10110100;
    check (0,0,1);
    
    #10 $display("all tests are completed");
    $finish;
  end
endmodule
    
    
