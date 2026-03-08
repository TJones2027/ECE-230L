module twos_compliment(
    input  [7:0] A,
    output [7:0] OUT
);

wire [7:0] inverted;
wire c1, c2, c3, c4, c5, c6, c7, c8;

assign inverted = ~A;

// Add 1 to inverted number
full_adder fa0(inverted[0], 1'b1, 1'b0, OUT[0], c1);
full_adder fa1(inverted[1], 1'b0, c1, OUT[1], c2);
full_adder fa2(inverted[2], 1'b0, c2, OUT[2], c3);
full_adder fa3(inverted[3], 1'b0, c3, OUT[3], c4);
full_adder fa4(inverted[4], 1'b0, c4, OUT[4], c5);
full_adder fa5(inverted[5], 1'b0, c5, OUT[5], c6);
full_adder fa6(inverted[6], 1'b0, c6, OUT[6], c7);
full_adder fa7(inverted[7], 1'b0, c7, OUT[7], c8);

endmodule
