
module ripple_carry_adder (
  input  logic [3:0] A,    
  input  logic [3:0] B,    
    input  logic Cin,        
  output logic [3:0] Sum,  
    output logic Cout       
);

    // Internal wires for the carry signals between stages
    logic C1, C2, C3;

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

