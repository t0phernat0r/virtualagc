/**
 * lib.sv
 *
 * RISC-V 32-bit Processor
 *
 * ECE 18-447
 * Carnegie Mellon University
 *
 * This is the library of standard components used by the RISC-V processor,
 * which includes both synchronous and combinational components.
 **/

/*----------------------------------------------------------------------------*
 *  You may edit this file and add or change any files in the src directory.  *
 *----------------------------------------------------------------------------*/

// Force the compiler to throw an error if any variables are undeclared

/*--------------------------------------------------------------------------------------------------------------------
 * Combinational Components
 *--------------------------------------------------------------------------------------------------------------------*/

/**
 * Selects on input from INPUTS inputs to output, each of WIDTH bits.
 *
 * Parameters:
 *  - INPUTS    The number of values from which the mux can select.
 *  - WIDTH     The number of bits each value contains.
 *
 * Inputs:
 *  - in        The values from which to select, packed together as a single
 *              bit-vector.
 *  - sel       The value from the inputs to output.
 *
 * Outputs:
 *  - out       The selected output from the inputs.
 **/
module mux
    #(parameter INPUTS=0, WIDTH=0)
    (input  logic [INPUTS-1:0][WIDTH-1:0]   in,
     input  logic [$clog2(INPUTS)-1:0]      sel,
     output logic [WIDTH-1:0]               out);

    assign out = in[sel];

endmodule: mux

/**
 * makes the inth bit 1 and the rest of the bits 0 if enabled
 *
 * Parameters:
 *  - INPUTS    The number of bits that can be decoded to
 *
 * Inputs:
 *  - in        The number of the bit that should be one
 *  - en        whether or not any bit should be one.
 *
 * Outputs:
 *  - out       the decoded output ((in**2)*en)
 **/

module decoder
   #(parameter WIDTH = 8)
   (output logic [WIDTH-1:0] out,
    input logic en,
    input logic  [$clog2(WIDTH)-1:0] in);
    always_comb begin
    if(en == 1'b0)
       out = 'b0;
    else
      out = 2**in;
    end
endmodule: decoder

/**
 * Adds two numbers of WIDTH bits, with a carry in bit, producing a sum and a
 * carry out bit.
 *
 * Parameters:
 *  - WIDTH     The number of bits of the numbers being summed together.
 *
 * Inputs:
 *  - cin       The carry in to the addition.
 *  - A         The first number to add.
 *  - B         The second number to add.
 *
 * Outputs:
 *  - cout      The carry out from the addition.
 *  - sum       The result of the addition.
 **/
module adder
    #(parameter WIDTH=0)
    (input  logic               cin,
     input  logic [WIDTH-1:0]   A, B,
     output logic               cout,
     output logic [WIDTH-1:0]   sum);

     assign {cout, sum} = A + B + cin;

endmodule: adder

/*--------------------------------------------------------------------------------------------------------------------
 * Synchronous Components
 *--------------------------------------------------------------------------------------------------------------------*/

/**
 * Latches and stores values of WIDTH bits and initializes to RESET_VAL.
 *
 * This register uses an asynchronous active-low reset and a synchronous
 * active-high clear. Upon clear or reset, the value of the register becomes
 * RESET_VAL.
 *
 * Parameters:
 *  - WIDTH         The number of bits that the register holds.
 *  - RESET_VAL     The value that the register holds after a reset.
 *
 * Inputs:
 *  - clk           The clock to use for the register.
 *  - rst_l         An active-low asynchronous reset.
 *  - clear         An active-high synchronous reset.
 *  - en            Indicates whether or not to load the register.
 *  - D             The input to the register.
 *
 * Outputs:
 *  - Q             The latched output from the register.
 **/
module register
   #(parameter                      WIDTH=0,
     parameter logic [WIDTH-1:0]    RESET_VAL='b0)
    (input  logic               clk, en, rst_l, clear,
     input  logic [WIDTH-1:0]   D,
     output logic [WIDTH-1:0]   Q);

     always_ff @(posedge clk, negedge rst_l) begin
         if (!rst_l)
             Q <= RESET_VAL;
         else if (clear)
             Q <= RESET_VAL;
         else if (en)
             Q <= D;
     end

endmodule:register


/*
 * Counter Logic
 */
module counter
    (input  logic clk, rst_l, en, 
     output logic [31:0] count );

    always_ff @(posedge clk, negedge rst_l) begin
        if(~rst_l) begin
            count <= 0;
        end
        else if (en) begin
            count <= count + 1;
        end
    end
endmodule: counter

/*
 * Counter Logic
 */
module counterS
    (input  logic clk, rst_l, en, clear,
     output logic [31:0] count);

    always_ff @(posedge clk, negedge rst_l) begin
        if(~rst_l) begin
            count <= 0;
        end
        else if(clear) begin
            count <= 0;
        end
        else if (en) begin
            count <= count + 1;
        end
    end
endmodule: counterS


module countFSM
    (input logic clk, rst_l, stall,
    output logic en_instr_0, en_instr_1, en_instr_2, en_instr_3);

    enum logic[1:0] {ZERO, ONE, TWO, THREE} state, nextState;


    always_ff @(posedge clk, negedge rst_l) begin
        if(~rst_l) begin
            state <= ZERO;
        end
        else begin
            state <= nextState;
        end
    end

    always_comb begin
        en_instr_0 = 0;
        en_instr_1 = 0;
        en_instr_2 = 0;
        en_instr_3 = 0;
        unique case (state)
            ZERO: begin
                  if(stall) begin
                    nextState = ONE;
                  end 
                  else begin
                    nextState = ZERO;
                    en_instr_0 = 1;
                  end
            end
            
            ONE: begin
                  if(stall) begin
                    nextState = TWO;
                  end 
                  else begin
                    nextState = ZERO;
                    en_instr_1 = 1;
                  end
            end
            
            TWO: begin
                  if(stall) begin
                    nextState = THREE;
                  end 
                  else begin
                    nextState = ZERO;
                    en_instr_2 = 1;
                  end
            end

            THREE: begin
                  nextState = ZERO;
                  en_instr_3 = 1;
            end
        endcase
    end

endmodule: countFSM

//TODO donny fill out register file
module register_file 
  (input  logic rst_l, clock, wr1_en, wr2_en,
   input  logic [14:0] wr1_data, wr2_data,
   input  reg_t rs1_sel, rs2_sel, wr1_sel, wr2_sel,
   output logic [14:0] rs1_data, rs2_data,
   output logic [2:0] bits_EB, bits_FB);

  logic [14:0] reg_A, reg_L, 
               reg_Q, 
               reg_BB,
               reg_CYR, reg_SR, reg_CYL, reg_SL,
               reg_TIME1, reg_TIME2;

  always_ff @(posedge clock) begin
      $display("-------------------------------------------------------------------");
      $display("A\t= %o (0x%x) DEC:%d SP:%f (SP CAT: %f)", 
               reg_A, reg_A, reg_A, reg_A/16384.0, (reg_A << 14 | reg_L[13:0])/16384.0);
      $display("L\t= %o (0x%x) DEC:%d SP:%f", reg_L, reg_L, reg_L, reg_L/16384.0);
      $display("Q\t= %o (0x%x)", reg_Q, reg_Q);
      $display("BB\t= %o (0x%x)", reg_BB, reg_BB);
      $display("CYR\t= %o (0x%x)", reg_CYR, reg_CYR);
      $display("SR\t= %o (0x%x)", reg_SR, reg_SR);
      $display("SL\t= %o (0x%x)", reg_SL, reg_SL);
      $display("TIME1\t= %o (0x%x)", reg_TIME1, reg_TIME1);
      $display("TIME2\t= %o (0x%x)", reg_TIME2, reg_TIME2);
  end

  always_ff @(posedge clock, negedge rst_l) begin
  // Register file writes
    if (~rst_l) begin
    // Reset Case
      reg_A <= 15'd0;
      reg_L <= 15'd0;
      reg_Q <= 15'd0;
      reg_BB[14:9] <= 6'd0;
      reg_CYR <= 15'd0;
      reg_CYL <= 15'd0;
      reg_SR <= 15'd0;
      reg_SL <= 15'd0;
      reg_TIME1 <= 15'd0;
      reg_TIME2 <= 15'd0;
    end
    else begin
    // Common Case
    // NOTE: If attempt a write of both data ports to same reg, port 2 has precedence.
      if (wr1_en) begin
        unique case (wr1_sel)
        // From Write Port 1
          // Accumulators
          A: reg_A <= wr1_data;
          L: reg_L <= wr1_data;

          // Link register
          Q: reg_Q <= wr1_data;

          // Bank registers
          EB: reg_BB[11:9] <= wr1_data[11:9];
          FB: reg_BB[14:12] <= wr1_data[14:12];
          BB: reg_BB[14:9] <= wr1_data[14:9];
          
          // Editing registers
          CYR: reg_CYR <= {wr1_data[0], wr1_data[14:1]};
          SR: reg_SR <= {wr1_data[14], wr1_data[14:1]};
          CYL: reg_CYL <= {wr1_data[13:0], wr1_data[14]};
          SL: reg_SL <= {wr1_data[13:0], 1'b0};

          // Timers
          TIME1: reg_TIME1 <= wr1_data;
          TIME2: reg_TIME2 <= wr1_data;
          default: begin
          // Default assignment ARBITRARY
            reg_A <= wr1_data;
          end
        endcase
      end
      if (wr2_en) begin
        unique case (wr2_sel)
        // From Write Port 2
          // Accumulators
          A: reg_A <= wr2_data;
          L: reg_L <= wr2_data;

          // Link register
          Q: reg_Q <= wr2_data;

          // Bank registers (only write to pertinent bits)
          EB: reg_BB[11:9] <= wr2_data[11:9];
          FB: reg_BB[14:12] <= wr2_data[14:12];
          BB: reg_BB[14:9] <= wr2_data[14:9];
          
          // Editing registers (shifted value is written)
          CYR: reg_CYR <= {wr2_data[0], wr2_data[14:1]};
          SR: reg_SR <= {wr2_data[14], wr2_data[14:1]};
          CYL: reg_CYL <= {wr2_data[13:0], wr2_data[14]};
          SL: reg_SL <= {wr2_data[13:0], 1'b0};

          // Timers
          TIME1: reg_TIME1 <= wr2_data;
          TIME2: reg_TIME2 <= wr2_data;
          default: begin
          // Default assignment ARBITRARY
            reg_A <= wr2_data;
          end
        endcase
      end 
    end
  end
  
  always_comb begin
  // Register file reads
    // To Read Port 1
    if ((rs1_sel == wr1_sel) && wr1_en)
    // Forwarding Case 1
      rs1_data = wr1_data;
    else if ((rs1_sel == wr2_sel) && wr2_en)
    // Forwarding Case 2
      rs1_data = wr2_data;
    else begin
    // Common Case
      unique case (rs1_sel)
        // Accumulators
        A: rs1_data = reg_A;
        L: rs1_data = reg_L;

        // Link register
        Q: rs1_data = reg_Q;

        // Bank registers
        EB: rs1_data = {3'd0, reg_BB[11:9], 9'd0};
        FB: rs1_data = {reg_BB[14:12], 13'd0};
        BB: rs1_data = {reg_BB[14:9], 9'd0};

        // Zero
        ZERO: rs1_data = 15'd0;

        // Editing registers
        CYR: rs1_data = reg_CYR;
        SR: rs1_data = reg_SR;
        CYL: rs1_data = reg_CYL;
        SL: rs1_data = reg_SL;
        
        // Timers
        TIME1: rs1_data = reg_TIME1;
        TIME2: rs1_data = reg_TIME2;
        default: begin
        // Default assignment ARBITRARY
          rs1_data = reg_A;
        end
      endcase
    end

    // To Read Port 2
    if ((rs2_sel == wr1_sel) && wr1_en)
    // Forwarding Case 1
      rs2_data = wr1_data;
    else if ((rs2_sel == wr2_sel) && wr2_en)
    // Forwarding Case 2
      rs2_data = wr2_data;
    else begin
    // Common Case
      unique case (rs2_sel)
        // Accumulators
        A: rs2_data = reg_A;
        L: rs2_data = reg_L;

        // Link register
        Q: rs2_data = reg_Q;

        // Bank registers
        EB: rs2_data = {3'd0, reg_BB[11:9], 9'd0};
        FB: rs2_data = {reg_BB[14:12], 13'd0};
        BB: rs2_data = {reg_BB[14:9], 9'd0};

        // Zero
        ZERO: rs2_data = 15'd0;

        // Editing registers
        CYR: rs2_data = reg_CYR;
        SR: rs2_data = reg_SR;
        CYL: rs2_data = reg_CYL;
        SL: rs2_data = reg_SL;
        
        // Timers
        TIME1: rs2_data = reg_TIME1;
        TIME2: rs2_data = reg_TIME2;
        default: begin
        // Default assignment ARBITRARY
          rs2_data = reg_A;
        end
      endcase
    end

    // Prevent unintentional latches
    reg_BB[8:0] = 12'd0;
    
    // Bank bit output taps for address translation module
    bits_EB = reg_BB[11:9];
    bits_FB = reg_BB[14:12];
  end 
   
endmodule: register_file

module IO_register_file
  (input  logic [14:0] data_write,
                       data_DSKY_VERB, 
                       data_DSKY_NOUN,
                       data_AXI_G,
                       data_AXI_RA,
                       data_AXI_RB,
                       data_AXI_ATX,
   input  IO_reg_t sel_read, sel_write,
   input  logic en_write, rst_l, clock,
   output logic [14:0] data_read);

  logic [14:0] data_DSKY_REG_1,
               data_DSKY_REG_2,
               data_DSKY_REG_3,
               data_DSKY_PROG_NUM,
               data_DSKY_LAMPS,
               data_AXI_DVA,
               data_AXI_DVATX,
               data_AXI_DVB,
               data_AXI_DVBTX;

  logic write_valid;

  always_ff @(posedge clock, negedge rst_l) begin
  // Output register writes
    if (~rst_l) begin
    // Reset Case
      data_DSKY_REG_1 <= 15'd0;
      data_DSKY_REG_2 <= 15'd0;
      data_DSKY_REG_3 <= 15'd0;
      data_DSKY_PROG_NUM[4:0] <= 5'd0;
      data_DSKY_LAMPS[11:0] <= 12'd0;
      data_AXI_DVA <= 15'd0;
      data_AXI_DVATX <= 15'd0;
      data_AXI_DVB <= 15'd0;
      data_AXI_DVBTX <= 15'd0;
    end
    else if (en_write) begin
    // Write Case
      unique case (sel_write)
        DSKY_REG_1: data_DSKY_REG_1 <= data_write;
        DSKY_REG_2: data_DSKY_REG_2 <= data_write;
        DSKY_REG_3: data_DSKY_REG_3 <= data_write;
        DSKY_PROG_NUM: data_DSKY_PROG_NUM[4:0] <= data_write[4:0];
        DSKY_LAMPS: data_DSKY_LAMPS[11:0] <= data_write[11:0];
        AXI_DVA: data_AXI_DVA <= data_write;
        AXI_DVATX: data_AXI_DVATX = data_write;
        AXI_DVB: data_AXI_DVB <= data_write;
        AXI_DVBTX: data_AXI_DVBTX = data_write;
        default: begin
        // Necessary as not all I/O registers writeable
        end
      endcase
    end
  end
  
  always_comb begin
    // I/O register reads
    // Check for valid writes
    write_valid = (~sel_write[3] | (sel_write[2:0] == 3'd0));
    if (en_write & write_valid & (sel_read == sel_write)) begin
    // Forwarding Case
      data_read = data_write;
    end
    else begin
    // Common Case
      unique case (sel_read)
        DSKY_REG_1: data_read = data_DSKY_REG_1;
        DSKY_REG_2: data_read = data_DSKY_REG_2;
        DSKY_REG_3: data_read = data_DSKY_REG_3;
        DSKY_PROG_NUM: data_read = data_DSKY_PROG_NUM;
        DSKY_LAMPS: data_read = data_DSKY_LAMPS; 
        AXI_DVA: data_read = data_AXI_DVA;
        AXI_DVATX: data_read = data_AXI_DVATX;
        AXI_DVB: data_read = data_AXI_DVB;
        AXI_DVBTX: data_read = data_AXI_DVBTX;
        DSKY_VERB: data_read = data_DSKY_VERB;
        DSKY_NOUN: data_read = data_DSKY_NOUN;
        AXI_G: data_read = data_AXI_G;
        AXI_RA: data_read = data_AXI_RA;
        AXI_RB: data_read = data_AXI_RB;
        AXI_ATX: data_read = data_AXI_ATX;
        default: begin
        // Default assignment ARBITRARY
          data_read = data_DSKY_LAMPS;
        end
      endcase
    end

    // Prevent unintentional latches
    data_DSKY_PROG_NUM[14:5] = 10'd0; 
    data_DSKY_LAMPS[14:12] = 3'd0;

  end

endmodule: IO_register_file

module addr_translate_ROM
  (input  logic [11:0] addr_soft,
   input  logic [2:0] bits_FB,
   output logic [13:0] addr_ROM);

  logic [13:0] offset_bank, addr_bank;
  logic [11:0] addr_norm_to_ROM, addr_norm_to_bank;
  logic addr_is_fixed;

  always_comb begin
    // Check if addr_soft points to fixed ROM
    addr_is_fixed = $unsigned(addr_soft) >= $unsigned(12'o4000);

    // If addr_soft point to fixed ROM, this value is selected
    // 12'o4000 is lowest software fixed ROM address
    // Fixed region of ROM occupy until address 12'o4000 (non-inclusive)
    addr_norm_to_ROM = $unsigned(addr_soft) - $unsigned(12'o4000);

    // 12'o2000 is lowest software banked ROM address
    // Banked region of ROM occupy address 12'o4000 and higher
    addr_norm_to_bank = $unsigned(addr_soft) + $unsigned(12'o2000);

    // 12'o2000 is size of each bank
    // Lookup table used to eliminate need for multiplier
    unique case (bits_FB)
      3'b000: offset_bank = 14'o00000;
      3'b001: offset_bank = 14'o02000;
      3'b010: offset_bank = 14'o04000;
      3'b011: offset_bank = 14'o06000;
      3'b100: offset_bank = 14'o10000;
      3'b101: offset_bank = 14'o12000;
      3'b110: offset_bank = 14'o14000;
      3'b111: offset_bank = 14'o16000;
    endcase  

    // If addr_soft point to banked ROM, this value is selected
    addr_bank = $unsigned(addr_norm_to_bank) + $unsigned(offset_bank);

    // Select fixed or banked translation
    addr_ROM = (addr_is_fixed) ? {2'd0, addr_norm_to_ROM} : addr_bank;
  end

endmodule: addr_translate_ROM

module addr_translate_RAM
  (input  logic [11:0] addr_soft,
   input  logic [2:0] bits_EB,
   output logic [10:0] addr_RAM);

  logic [10:0] offset_bank_pre, offset_bank, addr_bank;
  logic addr_is_fixed;

  always_comb begin
    // Check if addr_soft points to fixed RAM
    addr_is_fixed = $unsigned(addr_soft) < $unsigned(12'o1400);

    // 12'o1400 is lowest software banked RAM address
    // 12'o0400 is size of banks
    // Lookup table used to eliminate need for multiplier
    unique case (bits_EB[1:0])
      2'b00: offset_bank_pre = 11'o0000;
      2'b01: offset_bank_pre = 11'o0400;
      2'b10: offset_bank_pre = 11'o1000;
      2'b11: offset_bank_pre = 11'o1400;
    endcase

    // Always add 11'o2000 if MSB of EB bits is '1'
    offset_bank = (bits_EB[2]) ? 11'o2000 : offset_bank_pre;

    // If addr_soft point to banked RAM, this value is selected
    addr_bank = $unsigned(addr_soft[10:0]) + $unsigned(offset_bank);

    // Select fixed or banked translation
    addr_RAM = (addr_is_fixed) ? addr_soft[10:0] : addr_bank;
  end

endmodule: addr_translate_RAM

module addr_translate_r
  (input  logic [11:0] addr_k,
   input  logic [2:0] bits_EB, bits_FB,
   output logic [13:0] addr_ROM,
   output logic [10:0] addr_RAM);

  logic [13:0] addr_ROM_pre;
  logic [10:0] addr_RAM_pre;
  logic point_to_ROM;

  addr_translate_RAM translate_read_RAM (.addr_soft(addr_k),
                                         .bits_EB(bits_EB),
                                         .addr_RAM(addr_RAM_pre));

  addr_translate_ROM translate_read_ROM (.addr_soft(addr_k),
                                         .bits_FB(bits_FB),
                                         .addr_ROM(addr_ROM_pre));

  always_comb begin
    // Check if addr_k points to ROM, otherwise points to RAM
    point_to_ROM = $unsigned(addr_k) >= $unsigned(12'o2000);

    // Drive lowest valid address to RAM/ROM address port 
    // if addr_k point to opposite region
    {addr_RAM, addr_ROM} = (point_to_ROM) ? {11'o0000, addr_ROM_pre}
                                          : {addr_RAM_pre, 14'o2000};
  end

endmodule: addr_translate_r

module addr_translate_w
  (input  logic [11:0] addr_k,
   input  logic [2:0] bits_EB,
   input  logic en_write,
   output logic [10:0] addr_RAM,
   output logic en_write_final);

  logic point_to_RAM;

  addr_translate_RAM translate_write_RAM (.addr_soft(addr_k),
                                          .bits_EB(bits_EB),
                                          .addr_RAM(addr_RAM));

  assign point_to_RAM = en_write;

  // If attempt to write to ROM, force write enable to '0'
  assign en_write_final = (point_to_RAM) ? en_write : 1'b0;

endmodule: addr_translate_w

// All address translation contained within a single module
module addr_translate
  (input  logic [11:0] addr_pc, addr_r, addr_w,
   input  logic [2:0] bits_EB_r, bits_FB_r, bits_EB_w,
   input  logic en_write,
   output logic [13:0] addr_ROM_pc, addr_ROM_r,
   output logic [10:0] addr_RAM_r, addr_RAM_w,
   output logic en_write_final);

   addr_translate_ROM translate_pc (.addr_soft(addr_pc),
                                    .bits_FB(bits_FB_r),
                                    .addr_ROM(addr_ROM_pc));

   addr_translate_r translate_r (.addr_k(addr_r),
                                 .bits_EB(bits_EB_r),
                                 .bits_FB(bits_FB_r),
                                 .addr_ROM(addr_ROM_r),
                                 .addr_RAM(addr_RAM_r));

   addr_translate_w translate_w (.addr_k(addr_w),
                                 .bits_EB(bits_EB_w),
                                 .en_write(en_write),
                                 .addr_RAM(addr_RAM_w),
                                 .en_write_final(en_write_final));

endmodule: addr_translate

// Processor ALU
// Over/Underflow detection not yet configured
module arithmetic_logic_unit
  (input  alu_op_t operation_sel,
   input  logic [29:0] source_1,
   input  logic [14:0] source_2,
   output logic [29:0] result,
   output logic res_eq_0);

  logic [14:0] res_add_sub, res_div_quot, res_div_remain,
               add_sub_src_1, add_sub_src_2;
  logic [29:0] res_mult; 
  logic sel_subtract;

  always_comb begin
    // Result low order word default
    result[29:0] = 15'd0;
	 add_sub_src_1 = 15'd0;
	 add_sub_src_2 = 15'd0;
    sel_subtract = 1'b0;
    unique case (operation_sel)
      ALU_AD: begin
        sel_subtract = 1'b0;
        add_sub_src_1 = source_1[14:0];
        add_sub_src_2 = source_2;
        result[29:15] = res_add_sub;
      end
      ALU_SU: begin
        sel_subtract = 1'b1;
        add_sub_src_1 = source_1[14:0];
        add_sub_src_2 = source_2;
        result[29:15] = res_add_sub;
      end
      ALU_AUG: begin
        sel_subtract = source_2[14];
        add_sub_src_1 = source_1[14:0];
        add_sub_src_2 = 15'd1;
        result[29:15] = res_add_sub;
      end
      ALU_COM: begin
        result[29:15] = ~source_2;
      end
      ALU_READ: begin
        result[29:15] = source_2;
      end
      ALU_BRANCH: begin
        result[29:15] = source_1[14:0];
      end
      ALU_MP: begin
        result = res_mult;
      end
      ALU_DIM: begin
        if (res_eq_0) begin
          result = source_2;
        end
        else begin
          sel_subtract = ~source_2[14];
          add_sub_src_1 = source_1[14:0];
          add_sub_src_2 = 15'd1;
          result[29:15] = res_add_sub;
        end
      end
      ALU_OR: begin
        result[29:15] = source_1[14:0] | source_2;
      end
      ALU_AND: begin
        result[29:15] = source_1[14:0] & source_2;
      end
      ALU_XOR: begin
        result[29:15] = source_1[14:0] ^ source_2;
      end
      ALU_INCR: begin
        sel_subtract = 1'b0;
        add_sub_src_1 = 15'd1;
        add_sub_src_2 = source_2;
        result[29:15] = res_add_sub;
      end
      ALU_DV: begin
        result = {res_div_quot, res_div_remain};
      end
      ALU_QXCH: begin
        result = {source_1[14:0], source_2};
      end
      default: begin
      // Assignments Arbitrary
        add_sub_src_1 = 15'd0;
        add_sub_src_2 = 15'd0;
        sel_subtract = 1'b0;
      end
    endcase

    // Set the zero flag
    res_eq_0 = (source_2 == 15'd0 || source_2 == 15'o77777);

  end

  ones_comp_add_sub alu_add_sub (.sum(res_add_sub),
                                 .x(add_sub_src_1),
                                 .y(add_sub_src_2),
                                 .subtract(sel_subtract));

  ones_comp_mult alu_mult (.prod(res_mult),
                           .x(source_1[14:0]),
                           .y(source_2));

  ones_comp_div alu_div (.quot(res_div_quot),
                         .remain(res_div_remain),
                         .numer(source_1),
                         .denom(source_2));

endmodule: arithmetic_logic_unit

module branching_logic 
  (input logic eq_0, sign_bit,
   input branch_t ctrl_branch,
   output logic branch);

  assign branch = (ctrl_branch==BRANCH) ? 1'b1 : (ctrl_branch==BZF && eq_0) ? 1'b1 : (ctrl_branch == BZMF && (eq_0 || sign_bit)) ? 1'b1 : 1'b0;
      

endmodule: branching_logic
    
module stall_logic
  (input ctrl_t ctrl_D, ctrl_E, ctrl_W,
   input logic branch_E,
   output logic stall, flush);


  always_comb begin
    flush = 1'b0;
    
    if(branch_E) begin
       flush = 1'b1;
    end
  end


  always_comb begin
    stall = 1'b0;
    if ((((ctrl_D.rs1_sel==ctrl_E.wr1_sel)  || (ctrl_D.rs2_sel==ctrl_E.wr1_sel)) && ctrl_E.wr1_en) || (((ctrl_D.rs1_sel==ctrl_E.wr2_sel) || (ctrl_D.rs2_sel==ctrl_E.wr2_sel)) && ctrl_E.wr2_en)) begin
        stall = 1'b1;
    end
    else if ((ctrl_D.K==ctrl_E.K && (ctrl_E.RAM_write_en || ctrl_E.IO_write_en)) || (ctrl_D.K==ctrl_W.K && (ctrl_W.RAM_write_en || ctrl_W.IO_write_en) && (~branch_E)))
        stall = 1'b1;
    end


endmodule: stall_logic

module receive_connector
  (input  logic [7:0] RX_byte,
   input  logic RX_valid;
   input  logic clk, resetn,
   output logic [5:0][2:0]  data_VERB, data_NOUN,
                            data_AXIG, data_AXIRA, data_AXIRB, data_AXIATX);

  logic [5:0][2:0] data_next_VERB, data_next_NOUN,
                   data_next_AXIG, data_next_AXIRA, data_next_AXIRB, data_next_AXIATX;
  logic [2:0] state_count, preset_state_count,
              byte_octal, byte_octal_corr;
  logic incr_state_count, dn_state_count,
        byte_eq_start, byte_eq_end, byte_eq_neg, byte_eq_pos,
        sign_reg_val, update_sign_reg_val,
        state_signed, state_read,
        en_wr_VERB, en_wr_NOUN, 
        en_wr_AXIG, en_wr_AXIRA, en_wr_AXIRB, en_wr_AXIATX;

  enum logic [2:0] {INIT = 3'd0,
                    VERB = 3'd1,
                    NOUN = 3'd2,
                    AXIG = 3'd3,
                    AXIRA = 3'd4,
                    AXIRB = 3'd5,
                    AXIATX = 3'd6} state, next_state;

  always_ff @(posedge clk) begin
  // Counter for byte reads in each state
    if (~resetn) begin
    // syncronous reset
      state_count <= 3'd0;
    end
    else if (state ~= next_state) begin
    // reset when entering new I/O reg state
      state_count <= 3'd0;
    end
    else if (incr_state_count) begin
    // increment case
      state_count <= state_count + 3'd1;
    end
    else begin
    // no increment case
      state_count <= state_count;
    end
  end

  always_ff @(posedge clk) begin
  // Drive and maintain ctrl bit for complementing incoming sign-interpretive octal digits
    if (~resetn) begin
      sign_reg_val <= 1'b0;
    end
    else if (state ~= next_state) begin
      sign_reg_val <= 1'b0;
    end
    else if (update_sign_reg_val) begin
    // Updated based on received char (+ or -)
      sign_reg_val <= byte_eq_neg;
    end
    else begin
    // No write case
      sign_reg_val <= sign_reg_val;
    end

  end

  always_comb begin
  // next_state driver
    unique case (state)
      INIT: begin
        next_state = (RX_valid & byte_eq_start) ? VERB : state;
      end 
      VERB: begin
        next_state = (dn_state_count) ? NOUN : state;
      end
      NOUN: begin
        next_state = (dn_state_count) ? AXIG : state;
      end
      AXIG: begin
        next_state = (dn_state_count) ? AXIRA : state;
      end
      AXIRA: begin
        next_state = (dn_state_count) ? AXIRB : state;
      end
      AXIRB: begin  
        next_state = (dn_state_count) ? AXIATX : state;
      end
      AXIATX: begin
        next_state = (dn_state_count & byte_eq_end) ? INIT : state;
      end
      default: begin
      end
    endcase 
  end

  always_ff @(posedge clk) begin
  // State register
    if (~resetn) begin
      state <= IDLE;
    end
    else begin
      state <= next_state;
    end
  end

  //
  // INTERNAL COMBINATIONAL DRIVERS
  //
  
  always_comb begin
  // ASCII interpreter
    // default assignments
    byte_eq_start = 1'b0;
    byte_eq_end = 1'b0;
    byte_eq_pos = 1'b0;
    byte_eq_neg = 1'b0;
    byte_octal = 3'd0;
    unique case (RX_byte)
      8'd60: begin
      // '<'
        byte_eq_start = 1'b1;
      end
      8'd62: begin
      // '>'
        byte_eq_end = 1'b1;
      end
      8'd43: begin
      // '+'
        byte_eq_pos = 1'b1;
      end
      8'd45: begin
      // '-'
        byte_eq_neg = 1'b1;
      end
      8'd48: begin
      // '0'
        byte_octal = 3'd0;
      end
      8'd49: begin
      // '1'
        byte_octal = 3'd1;
      end
      8'd50: begin
      // '2'
        byte_octal = 3'd2;
      end
      8'd51: begin
      // '3'
        byte_octal = 3'd3;
      end
      8'd52: begin
      // '4'
        byte_octal = 3'd4;
      end
      8'd53: begin
      // '5'
        byte_octal = 3'd5;
      end
      8'd54: begin
      // '6'
        byte_octal = 3'd6;
      end
      8'd55: begin
      // '7'
        byte_octal = 3'd7;
      end
    endcase
  end

  always_comb begin 
    // Determine if current state requires sign interpretation
    state_signed = ((state == AXIG) |
                    (state == AXIRA) |
                    (state == AXIRB) |
                    (state == AXIATX));

    // Determine if current state involves data for input registers
    state_read = ((state == VERB) |
                  (state == NOUN) |
                  (state == AXIG) |
                  (state == AXIRA) |
                  (state == AXIRB) |
                  (state == AXIATX));

    // Set preset value for counter based on current state
    preset_state_count = (state_signed) ? 3'd6 : ((state_read) ? 3'd2 : 3'd0); 
    
    // Counter dn bit
    dn_state_count = (state_count == preset_state_count);

    // No counter increment enabled in IDLE
    incr_state_count = (state_read & RX_valid & ~dn_state_count);

    // Only update sign
    update_sign_reg_val = (state_signed & 
                           (state_count == 3'd0) &
                           RX_valid);

    // Input register octal digit sign corrected
    byte_octal_corr = (sign_reg_val) ? ~byte_octal : byte_octal;
  end
  
  //
  // INPUT REGISTER WRITES
  //
  
  always_ff @(posedge clk) begin
  // AGC Input Registers
    if (~resetn) begin
      data_VERB <= 15'd0;
      data_NOUN <= 15'd0;
      data_AXIG <= 15'd0;
      data_AXIRA <= 15'd0;
      data_AXIRB <= 15'd0;
      data_AXIATX <= 15'd0;  
    end
    else begin
    
    end
  end

   always_comb begin
    data_next_VERB = data_VERB;
    data_next_NOUN = data_NOUN;
    data_next_AXIG = data_AXIG;
    data_next_AXIRA = data_AXIRA;
    data_next_AXIRB = data_AXIRB;
    data_next_AXIATX = data_AXIATX;
    unique case (state)
      VERB: begin

      end
      NOUN: begin
        
      end
      AXIG: begin
        
      end
      AXIRA: begin
        
      end
      AXIRB: begin

      end
      AXIRB: begin

      end
      AXIATX: begin

      end
      default: begin
      end
    endcase
  end

endmodule: receive_connector

module transmit_fsm
  (input logic clock, reset_n, 
   output logic prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig, uart_tx_en,
   input logic start_send, reg2, digit5, digit11, digit1, reg3, uart_tx_busy);

  enum logic [2:0] {RESET = 3'd0, SEND_REG = 3'd1, SEND_PROG = 3'd2,
                    SEND_LAMPS = 3'd3, SEND_AXI = 3'd4} state, nextState;

  always_comb begin
    case(state)
      RESET: nextState = start_send ? SEND_REG : RESET;
      SEND_REG: nextState = (digit5 && reg2) ? SEND_PROG : SEND_REG;
      SEND_PROG: nextState = (digit1) ? SEND_LAMPS : SEND_PROG;
      SEND_LAMPS: nextState = (digit11) ? SEND_AXI : SEND_LAMPS;
      SEND_AXI: nextState = (digit5 && reg3) ? RESET : SEND_AXI;
    endcase
  end

  always_comb begin
    uart_tx_en = 1'b1;
    if(uart_tx_busy) begin
      {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig} = 10'b0000000000;
    end
    else begin
     case(state)
      RESET: begin 
        {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig} = start_send ? 10'b000010111 : 10'b0000000011;
        uart_tx_en = start_send ? 1'b1 : 1'b0;
      end
      SEND_REG: {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig} = (digit5 && reg2) ? 10'b0100000011 : (digit5) ? 10'b0100010001 : 10'b0100001000;
      SEND_PROG: {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig} = (digit1) ? 10'b1000000011 : 10'b1000001010;
      SEND_LAMPS: {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig} = (digit11) ? 10'b0001000011 : 10'b0001001010;
      SEND_AXI: {prog_read, read_reg, read_axi_reg, send_lamps, send_start, en_reg, en_dig, clear_send, clear_reg, clear_dig}  = (digit5 && reg3) ? 10'b0110000011 : (digit5) ? 10'b0110010001 :  10'b0110001000;
     endcase
    end
  end


  always_ff @(posedge clock, negedge reset_n)
    if (~reset_n)
      state <= RESET;
    else if (~uart_tx_busy)
      state <= nextState;

endmodule: transmit_fsm

//connects uart ip to IO registers
module transmit_connector
 (input logic clock, reset_n, uart_tx_busy,
  input logic [14:0] io_reg_data,
  output logic uart_tx_en, 
  output IO_reg_t read_sel,
  output logic [7:0] uart_tx_data);

  logic clk, rst_l, start_send, reg2, digit5, digit11, digit1, reg3;
  logic send_lamps, read_axi_reg;
  logic [15:0] reg_char, axi_char, lamp_char;
  logic clear_send, clear_reg, clear_dig, en_reg, en_dig, send_start, read_reg, prog_read;
  logic [31:0] send_count, digit_count, reg_count;
  logic [3:0] reg_digit_index_low, reg_digit_index_high, axi_digit_index_low, axi_digit_index_high, lamp_digit_index;

  assign clk = clock;
  assign rst_l = reset_n;
 
  assign start_send = send_count == 'd1000;
  assign reg2 = reg_count == 'd2;
  assign reg3 = reg_count == 'd3;
  assign digit5 = digit_count == 'd5;
  assign digit11 = digit_count == 'd11;
  assign digit1 = digit_count == 'd1;
  assign reg_digit_index_low = ('d5 - digit_count) * 3;
  assign reg_digit_index_high = reg_digit_index_low + 'd2;
  assign axi_digit_index_low = ('d5 - digit_count) * 3;
  assign axi_digit_index_high = axi_digit_index_low + 'd2;
  assign lamp_digit_index = ('d11 - digit_count);


  counterS c1(.clk, .rst_l(rst_l), .en(1'b1), .count(send_count), .clear(clear_send)); //count since last time you sent
  counterS c2(.clk, .rst_l(rst_l), .en(en_reg), .count(reg_count), .clear(clear_reg)); //counts how many registers we have sent
  counterS c3(.clk, .rst_l(rst_l), .en(en_dig), .count(digit_count), .clear(clear_dig)); //how many octal digits have been sent


  //uart_tx_data_assignment
  always_comb begin
    reg_char = {1'b0, io_reg_data} >> reg_digit_index_low;
    axi_char = {1'b0, io_reg_data} >> axi_digit_index_low; 
    lamp_char = {1'b0, io_reg_data} >> lamp_digit_index;
   //sending the first char
    uart_tx_data = 8'd0;
    if(send_start) begin
      uart_tx_data = 8'd30;
    end
    else if(read_reg && (digit_count == 8'd0)) begin
      uart_tx_data = io_reg_data[14] ? 8'h2D : 8'h2B; 
    end
    else if(read_reg && (digit_count == 8'd1)) begin
      uart_tx_data = {6'b0, io_reg_data[13:12]} + 'h30;
    end
    else if(read_reg && read_axi_reg) begin
      uart_tx_data = {5'b0, axi_char[2:0]} + 'h30;
    end
    else if(read_reg) begin
      uart_tx_data = {5'b0, reg_char[2:0]} + 'h30;
    end
    else if(prog_read && (digit_count == 8'd0)) begin
      uart_tx_data = {6'b0, io_reg_data[4:3]} + 'h30;
    end
    else if(prog_read) begin
      uart_tx_data = {5'b0, io_reg_data[2:0]} + 'h30;
    end
    else if(send_lamps) begin
      uart_tx_data = {7'b0, lamp_char[0]} + 'h30;
    end
  end
 
  //read_sel assignment
  always_comb begin
  read_sel = DSKY_LAMPS;
    if(read_reg && read_axi_reg) begin
      read_sel = IO_reg_t'(4'd5 + reg_count); //4'd5 is the beginning of the AXI registers
    end
    else if(read_reg) begin
      read_sel = IO_reg_t'(4'd0 + reg_count); //4'd0 is the beginning of the DSKY registers
    end
    else if(send_lamps) begin
      read_sel = DSKY_LAMPS;
    end
    else if(prog_read) begin
      read_sel = DSKY_PROG_NUM;
    end
  end
  
  //ctrl fsm
  transmit_fsm f1(.clock, .reset_n, .read_reg, .read_axi_reg, .send_lamps, .uart_tx_busy,
                  .send_start, .start_send, .reg2, .digit1, .digit11, .prog_read, .uart_tx_en,
                  .digit5, .reg3, .en_reg, .en_dig, .clear_send, .clear_reg, .clear_dig);
 
endmodule: transmit_connector
