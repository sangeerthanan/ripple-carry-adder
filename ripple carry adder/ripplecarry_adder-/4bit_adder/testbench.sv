
`timescale 1ns/1ps

module ripple_carry_adder_tb;

   
  logic [3:0] A, B;
    logic Cin;
  logic [3:0] Sum;
    logic Cout;

   
    ripple_carry_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ripple_carry_adder_tb);
end


   
    initial begin
        
        #5 A = 4'd3; B = 4'd3; Cin = 0; 
        #5 A = 4'd5; B = 4'd2; Cin = 1; 
       #5 A = 4'b1010; B = 4'b0001; Cin = 0; 
       
      $finish();
    end

endmodule
