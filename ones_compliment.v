module ones_compliment (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum
);
    wire [3:0] s1;
    wire c0, c1, c2, c3;
    wire [3:0] final_sum;
    wire dummy_c0, dummy_c1, dummy_c2, dummy_c3;

    // First 4-bit Adder: A + B
    full_adder fa0 (A[0], B[0], 1'b0, s1[0], c0);
    full_adder fa1 (A[1], B[1], c0,   s1[1], c1);
    full_adder fa2 (A[2], B[2], c1,   s1[2], c2);
    full_adder fa3 (A[3], B[3], c2,   s1[3], c3);

    // Second 4-bit Adder: Add the Carry-out (c3) back to s1
    // This is the carry
    full_adder res0 (s1[0], c3,   1'b0, Sum[0], dummy_c0);
    full_adder res1 (s1[1], 1'b0, dummy_c0, Sum[1], dummy_c1);
    full_adder res2 (s1[2], 1'b0, dummy_c1, Sum[2], dummy_c2);
    full_adder res3 (s1[3], 1'b0, dummy_c2, Sum[3], dummy_c3);

endmodule