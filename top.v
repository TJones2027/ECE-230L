module top (
    input [9:0] sw,
    output [13:0] led
);
    // 1. Half Subtractor
    half_sub sub_inst (
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .Borrow(led[1])
    );

    // 2. Ones' Complement Adder (4-bit)
    ones_compliment ones_inst (
        .A(sw[5:2]), // sw[5], sw[4], sw[3], sw[2]
        .B(sw[9:6]), // sw[9], sw[8], sw[7], sw[6]
        .Sum(led[5:2])
    );

    // 3. Two's Complement Converter (8-bit)
    // Note: Uses sw[9:2] as the 8-bit input
    twos_compliment twos_inst (
        .In(sw[9:2]),
        .Out(led[13:6])
    );

endmodule