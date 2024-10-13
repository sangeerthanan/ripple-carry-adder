// ripple_carry_adder.sv
module ripple_carry_adder (
  input  logic [7:0] A,    // 4-bit input A
  input  logic [7:0] B,    // 4-bit input B
    input  logic Cin,        // Carry input
  output logic [7:0] Sum,  // 4-bit Sum output
    output logic Cout        // Carry output
);

    // Internal wires for the carry signals between stages
    logic C1, C2, C3,C4,C5,C6,C7;

    // Instantiate 4 full adders to form the 4-bit ripple carry adder
    full_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(C1)
    );

    full_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C1),
        .Sum(Sum[1]),
        .Cout(C2)
    );

    full_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C2),
        .Sum(Sum[2]),
        .Cout(C3)
    );

    full_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C3),
        .Sum(Sum[3]),
      .Cout(C4)
    );
  
 	full_adder FA4 (
      .A(A[4]),
      .B(B[4]),
      .Cin(C4),
      .Sum(Sum[4]),
      .Cout(C5)
    );
  	full_adder FA5 (
      .A(A[5]),
      .B(B[5]),
      .Cin(C5),
      .Sum(Sum[5]),
      .Cout(C6)
    );
  	full_adder FA6 (
      .A(A[6]),
      .B(B[6]),
      .Cin(C6),
      .Sum(Sum[6]),
      .Cout(C7)
    );
  	full_adder FA7 (
      .A(A[7]),
      .B(B[7]),
      .Cin(C7),
      .Sum(Sum[7]),
      .Cout(Cout)
    );
 

endmodule

// Full adder module used in the ripple carry adder
module full_adder (
    input  logic A,       // First operand
    input  logic B,       // Second operand
    input  logic Cin,     // Carry input
    output logic Sum,     // Sum output
    output logic Cout     // Carry output
);

    // Sum calculation: A XOR B XOR Cin
    assign Sum = A ^ B ^ Cin;

    // Carry out calculation: (A AND B) OR (Cin AND (A XOR B))
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
