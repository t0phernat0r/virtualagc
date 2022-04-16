
`default_nettype none

`include "internal_defines.vh"
`include "uart_tx.v"
`include "uart_rx.v"
`include "core.sv"
`include "agc_rom_new/agc_rom_new.v"
`include "agc_ram/agc_ram.v"
`include "lib.sv"
`include "comp_units.sv"
`include "decode.sv"
`include "mypll.v"


module TB;
  logic clock, reset_n, tx, rx, clock50;

  initial begin
    clock50 = 1'b0;
    reset_n = 1'b1;
    reset_n <= #1 1'b0;
    reset_n <= #2 1'b1;
    forever #5 clock50 = ~clock50;
  end

  //TODO instantiate ROM, and IO
  //data is input data

  logic [14:0] ROM_pc_data, ROM_constant_data, RAM_read_data, IO_read_data;
  logic [14:0] RAM_write_data, IO_write_data;
  logic [13:0] ROM_pc_address, ROM_constant_address; 
  logic [10:0]RAM_read_address, RAM_write_address;
  logic [4:0] IO_read_sel, IO_write_sel;
  logic RAM_write_en, stall, halt, IO_write_en;


/*
  // PLACEHOLDER UNTIL SERIAL INTERFACE MODULES EXIST TO DRIVE THESE
  // INPUT DATA FOR AGC CPU
  always_comb begin
    DSKY_VERB_data = 15'h37;
    DSKY_NOUN_data = 15'h5;
    AXI_G_data = 15'h123;
    AXI_RA_data = 15'h456;
    AXI_RB_data = 15'h789;
    AXI_ATX_data = 15'hABC;
  end
*/

  mypll p1(     .refclk(clock50),
                .rst(reset_n),
                .outclk_0(clock),
                .locked());




  agc_rom_new rom(.aclr(~reset_n), .address_a(ROM_pc_address), .address_b(ROM_constant_address), .clock, .addressstall_a(stall), .addressstall_b(stall), .q_a(ROM_pc_data), .q_b(ROM_constant_data));
  agc_ram ram(.aclr(~reset_n), .clock, .data(RAM_write_data), .rd_addressstall(stall), .wraddress(RAM_write_address), .wren(RAM_write_en), .q(RAM_read_data), .rdaddress(RAM_read_address), .rden(1'b1));
  IO_unit io(.clock, .reset_n, .IO_read_sel, .IO_write_data, .IO_read_data, .IO_write_en, .IO_write_sel, .tx, .rx);
  Core core(.clock, .reset_n, .ROM_pc_data, .ROM_constant_data, .RAM_read_data, .IO_read_data, .RAM_write_data, 
            .IO_write_data, .ROM_pc_address, .ROM_constant_address, .RAM_read_address, .RAM_write_address,
            .IO_read_sel, .IO_write_sel, .RAM_write_en_F(RAM_write_en), .stall, .halt_F(halt), .IO_write_en_F(IO_write_en)); 


  initial begin
    wait(halt);
    $finish;
  end
  

  initial begin
    #50000
    $finish;
  end
endmodule : TB
