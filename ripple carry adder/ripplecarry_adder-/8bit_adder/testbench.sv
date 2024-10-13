// ripple_carry_adder_tb.sv
`timescale 1ns/1ps

module ripple_carry_adder_tb;

    // Testbench signals
  logic [7:0] A, B;
    logic Cin;
  logic [7:0] Sum;
    logic Cout;

    // Instantiate the ripple carry adder
    ripple_carry_adder dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Generate the VCD file for waveform analysis
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ripple_carry_adder_tb);
end


    // Test procedure
    initial begin
        // Apply test cases
        #5 A = 8'd43; B = 8'd6; Cin = 0; 
        #5 A = 8'd45; B = 8'd10; Cin = 1; 
        #5 A = 4'd300; B = 4'd56; Cin = 0; 
       
*/
        // Finish simulation
      $finish();
    end

    // Monitor changes for debugging
    /*initial begin
        $monitor("At time %0t: A = %b, B = %b, Cin = %b | Sum = %b, Cout = %b", 
                 $time, A, B, Cin, Sum, Cout);*/
    //end

endmodule
