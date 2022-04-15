`define NUM_BIT 15
`include "agc_mult_28/agc_mult_28.v"
`include "agc_div_28/agc_div_28.v"

// Classical gate-level half adder
module half_adder ( 
    output logic sum, c_out,
    input  logic x, y
);
    xor (sum, x, y);
    and (c_out, x, y);

endmodule: half_adder

// Classical gate-level full adder
// Composed partially of half adders
module full_adder (
    output logic sum, c_out,
    input  logic x, y, c_in
);
    logic c_out_1, sum_1,
          c_out_2;

    // Generate "half sum" of operands
    half_adder ha_1 (.sum(sum_1),
                     .c_out(c_out_1),
                     .x(x), .y(y));

    // Generate "full sum" ("half sum" + c_in)
    half_adder ha_2 (.sum(sum),
                     .c_out(c_out_2),
                     .x(c_in), .y(sum_1));

    // Generate final carry out
    or (c_out, c_out_1, c_out_2);

endmodule: full_adder

// Classical ripple carry adder
// Composed of full adders
module ripple_carry_adder 
#( parameter WIDTH_MULT = 1)
(
    output logic [(WIDTH_MULT * `NUM_BIT)-1:0] sum,
    output logic c_out,
    input  logic [(WIDTH_MULT * `NUM_BIT)-1:0] x, y,
    input  logic c_in
);
    logic [(WIDTH_MULT * `NUM_BIT)-1:0] c_out_array;

    genvar i;
    generate
        for (i = 0; i < (WIDTH_MULT * `NUM_BIT); i++) begin: full_adder_array
            if (i == 0) begin
                // Low order adder takes overall c_in
                full_adder a1(.sum(sum[0]),
                            .c_out(c_out_array[0]),
                            .x(x[0]), .y(y[0]),
                            .c_in(c_in));
            end
            else begin
                // following adders take c_out of prev adder
                full_adder a2(.sum(sum[i]),
                            .c_out(c_out_array[i]),
                            .x(x[i]), .y(y[i]),
                            .c_in(c_out_array[i-1]));
            end
        end: full_adder_array
    endgenerate

    // High order carry out to c_out
    assign c_out = c_out_array[(WIDTH_MULT * `NUM_BIT)-1];

endmodule: ripple_carry_adder

// Convert from one's complement, to two's complement
// Based around ripple carry adder
module convert_1c_2c 
#( parameter WIDTH_MULT = 1)
(   
    output logic [(WIDTH_MULT * `NUM_BIT)-1:0] twos_comp,
    input  logic [(WIDTH_MULT * `NUM_BIT)-1:0] ones_comp
);
    // Add 1'b1 to ones_comp if sign of ones_comp is 1'b1
    ripple_carry_adder #(WIDTH_MULT) conv_1_2 (.sum(twos_comp),
                                               .c_out(),
                                               .x(ones_comp), 
                                               .y({{((WIDTH_MULT * `NUM_BIT)-1){1'b0}}, 
                                                   ones_comp[(WIDTH_MULT * `NUM_BIT)-1]}),
                                               .c_in(1'b0));

endmodule: convert_1c_2c

// Convert from two's complement, to one's complement
// Based around ripple carry adder
module convert_2c_1c 
#( parameter WIDTH_MULT = 1)
(
    output logic [(WIDTH_MULT * `NUM_BIT)-1:0] ones_comp,
    output logic underflow_flag,
    input  logic [(WIDTH_MULT * `NUM_BIT)-1:0] twos_comp
);
    // Two's comp int_min cannot be represented in one's comp
    assign underflow_flag = (twos_comp == 
                             {1'b1, {((WIDTH_MULT * `NUM_BIT)-1){1'b0}}});

    // Add -1 to twos_comp if sign of twos_comp is 1'b1
    ripple_carry_adder #(WIDTH_MULT) conv_2_1 (.sum(ones_comp),
                                               .c_out(),
                                               .x(twos_comp),
                                               .y({(WIDTH_MULT * `NUM_BIT){
                                                   twos_comp[(WIDTH_MULT * `NUM_BIT)-1]}}),
                                               .c_in(1'b0));

endmodule: convert_2c_1c

//
// CONSTRUCTING THE ALU ADD/SUB UNIT
//

// Ripple carry adder w/ end-around carry
module ones_comp_adder (
    output logic [`NUM_BIT-1:0] sum,
    input  logic [`NUM_BIT-1:0] x, y
);
    logic [`NUM_BIT-1:0] sum_pre;
    logic end_around_carry;

    // Perform the core addition
    ripple_carry_adder #(1) add_pre (.sum(sum_pre),
                                     .c_out(end_around_carry),
                                     .x(x), .y(y),
                                     .c_in(1'b0));

    // Perform end-around carry correction
    ripple_carry_adder #(1) add_eac (.sum(sum),
                                     .c_out(),
                                     .x(sum_pre), .y(15'd0),
                                     .c_in(end_around_carry));

endmodule: ones_comp_adder

// Adder/subtractor w/ select line
module ones_comp_add_sub (
    output logic [`NUM_BIT-1:0] sum,
    input  logic [`NUM_BIT-1:0] x, y,
    input  logic subtract
);
    logic [`NUM_BIT-1:0] y_operand;

    // Negate y in case of subtraction
    assign y_operand = (subtract) ? ~y : y;

    // Perform computation
    ones_comp_adder add_sub (.sum(sum),
                             .x(x), .y(y_operand));

endmodule: ones_comp_add_sub

//
// CONSTRUCTING THE ALU MULTIPLIER
//

// Altera unsigned lmp_mult megafunction
module ones_comp_mult (
    output logic [29:0] prod,
    input  logic [14:0] x, y
);
    logic [27:0] prod_unsigned;
    logic [13:0] x_unsigned, y_unsigned;
    logic oper_opp_sign, x_eq_0, y_eq_0,
          sign_prod;

    // Convert operands to unsigned if necessary
    assign x_unsigned = (x[14]) ? ~x[13:0] : x[13:0];
    assign y_unsigned = (y[14]) ? ~y[13:0] : y[13:0];

    agc_mult_28 mult_unsigned (.result(prod_unsigned),
                               .dataa(x_unsigned),
                               .datab(y_unsigned));

    always_comb begin
        oper_opp_sign = x[14] ^ y[14];
        x_eq_0 = ((x == 15'd0) | (x == 15'o77777));
        y_eq_0 = ((y == 15'd0) | (y == 15'o77777));

        // Handle special sign cases for prod of zero
        if (x_eq_0 & ~y_eq_0 & oper_opp_sign) begin
            sign_prod = 1'b1;
        end
        else if (x_eq_0 | y_eq_0) begin
            sign_prod = 1'b0;
        end
        else begin
            sign_prod = oper_opp_sign;
        end

        // Prod driven based on sign
        {prod[29], prod[14]} = {sign_prod, sign_prod};
        {prod[28:15], prod[13:0]} = (sign_prod) ? {~prod_unsigned[27:14], ~prod_unsigned[13:0]}
                                                : {prod_unsigned[27:14], prod_unsigned[13:0]};
    end

endmodule: ones_comp_mult

//
// CONSTRUCTING THE ALU DIVIDER
//

// Altera unsigned LPM_DIVIDE megafunction
module ones_comp_div (
    output logic [14:0] quot, remain,
    input  logic [29:0] numer,
    input  logic [14:0] denom
);
    logic [27:0] numer_unsigned, quot_unsigned;
    logic [13:0] denom_unsigned; 
    logic numer_high_zero, numer_low_zero,
          numer_sign_bit;

    always_comb begin
        // Convert numerator to unsigned if necessary
        numer_high_zero = ((numer[29:15] == 15'd0) | (numer[29:15] == 15'o77777));
        numer_low_zero = ((numer[14:0] == 15'd0) | (numer[14:0] == 15'o77777));
        if (numer_high_zero & numer_low_zero) begin
            numer_sign_bit = 1'b0;
            numer_unsigned = 28'd0;
        end
        else if (numer_high_zero) begin
            numer_sign_bit = numer[14];
            numer_unsigned[27:14] = 14'd0;
            numer_unsigned[13:0] = (numer[14]) ? ~numer[13:0] : numer[13:0];
        end
        else if (numer_low_zero) begin
            numer_sign_bit = numer[29];
            numer_unsigned[27:14] = (numer[29]) ? ~numer[28:15] : numer[28:15];
            numer_unsigned[13:0] = 14'd0;
        end
        else begin
        // ASSUMPTION: both half words of numer same sign
            numer_sign_bit = numer[29];
            numer_unsigned = (numer[29]) ? {~numer[28:15], ~numer[13:0]} 
                                         : {numer[28:15], numer[13:0]};
        end
        // Convert denominator to unigned if necessary
        denom_unsigned = (denom[14]) ? ~denom[13:0] : denom[13:0];
    end

    agc_div_28 div_unsigned (.quotient(quot_unsigned),
                             .remain(remain[13:0]),
                             .numer(numer_unsigned),
                             .denom(denom_unsigned));

    // PLACEHOLDER TO ALLOW FOR MULT TESTING!!!!!!!
    always_comb begin
        quot = 15'd0;
        remain[14] = 1'b0;
    end


endmodule: ones_comp_div





    
