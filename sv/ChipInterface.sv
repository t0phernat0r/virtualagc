`default_nettype none

`include "internal_defines.vh"
`include "core.sv"
`include "agc_rom_new/agc_rom_new.v"
`include "agc_ram/agc_ram.v"
`include "lib.sv"
`include "comp_units.sv"
`include "decode.sv"



module ChipInterface

   (input  logic       CLOCK_50,
   inout  logic  [35:0] GPIO,
   output logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
   input  logic [0:0] KEY);
  
  logic clock, reset_n, rx, tx;
  logic [23:0] bcd;

  assign reset_n = KEY;
  
  assign rx = GPIO[1];
  assign GPIO[3] = tx;
  assign IO_read_sel = IO_reg_t'(IO_read_sel_cpu);
  assign IO_write_sel = IO_reg_t'(IO_write_sel_cpu);

  BCDtoDisplay b1( .HEX5, .HEX4, .HEX3, .HEX2, .HEX1, .HEX0, .bcd);
 
  assign bcd = {10'b0, ROM_pc_address};

  //TODO instantiate ROM, and IO
  //data is input data

  logic [14:0] ROM_pc_data, ROM_constant_data, RAM_read_data, IO_read_data;
  logic [14:0] RAM_write_data, IO_write_data, data_VERB, data_NOUN;
  logic [14:0] DSKY_VERB_data,
               DSKY_NOUN_data,
               AXI_MISSION_TIME_data,
               AXI_APOGEE_data,
               AXI_PERIGEE_data;
  logic [13:0] ROM_pc_address, ROM_constant_address; 
  logic [10:0]RAM_read_address, RAM_write_address;
  logic [4:0] IO_read_sel_cpu, IO_write_sel_cpu;
  IO_reg_t IO_read_sel, IO_write_sel;
  logic RAM_write_en, stall, halt, IO_write_en;

  // PLACEHOLDER UNTIL SERIAL INTERFACE MODULES EXIST TO DRIVE THESE
  // INPUT DATA FOR AGC CPU
  assign {DSKY_VERB_data,
          DSKY_NOUN_data,
          AXI_MISSION_TIME_data,
          AXI_APOGEE_data,
          AXI_PERIGEE_data} = 'd0;

  good_pll p1(.in_clock(CLOCK_50), .reset_n, .out_clock(clock));  

  agc_rom_new rom(.aclr(~reset_n), .address_a(ROM_pc_address), .address_b(ROM_constant_address), .clock, .addressstall_a(stall), .addressstall_b(stall), .q_a(ROM_pc_data), .q_b(ROM_constant_data));
  agc_ram ram(.aclr(~reset_n), .clock, .data(RAM_write_data), .rd_addressstall(stall), .wraddress(RAM_write_address), .wren(RAM_write_en), .q(RAM_read_data), .rdaddress(RAM_read_address), .rden(1'b1));
  IO_unit io(.clock, .reset_n, .IO_read_sel, .IO_write_data, .IO_read_data, .IO_write_en, .IO_write_sel, .tx, .rx, .data_VERB, .data_NOUN);
  Core core(.clock, .reset_n, .ROM_pc_data, .ROM_constant_data, .RAM_read_data, .IO_read_data, .RAM_write_data, 
            .IO_write_data, .ROM_pc_address, .ROM_constant_address, .RAM_read_address, .RAM_write_address,
            .IO_read_sel(IO_read_sel_cpu), .IO_write_sel(IO_write_sel_cpu), .RAM_write_en_F(RAM_write_en), .stall, .halt_F(halt), .IO_write_en_F(IO_write_en));

endmodule : ChipInterface 
