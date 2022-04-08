
`default_nettype none

`include "internal_defines.vh"
`include "core.sv"
`include "agc_rom_new/agc_rom_new.v"
`include "agc_ram/agc_ram.v"
`include "lib.sv"
`include "comp_units.sv"
`include "decode.sv"


module TB;
  logic clock, reset_n;

  initial begin
    clock = 1'b0;
    reset_n = 1'b1;
    reset_n <= #1 1'b0;
    reset_n <= #2 1'b1;
    forever #5 clock = ~clock;
  end

  //TODO instantiate ROM, and IO
  //data is input data

  logic [14:0] ROM_pc_data, ROM_constant_data, RAM_read_data, IO_read_data;
  logic [14:0] RAM_write_data, IO_write_data;
  logic [14:0] DSKY_VERB_data,
               DSKY_NOUN_data,
               AXI_MISSION_TIME_data,
               AXI_APOGEE_data,
               AXI_PERIGEE_data;
  logic [13:0] ROM_pc_address, ROM_constant_address; 
  logic [10:0]RAM_read_address, RAM_write_address;
  logic [3:0] IO_read_sel, IO_write_sel;
  logic RAM_write_en, stall, halt, IO_write_en;

  // PLACEHOLDER UNTIL SERIAL INTERFACE MODULES EXIST TO DRIVE THESE
  // INPUT DATA FOR AGC CPU
  always_comb begin
    DSKY_VERB_data = 15'd37;
    DSKY_NOUN_data = 15'd5;
    AXI_MISSION_TIME_data = 15'b001010010000011;
    AXI_APOGEE_data = 15'b010000111010010;
    AXI_PERIGEE_data = 15'b111110000000010;
  end

  agc_rom_new rom(.aclr(~reset_n), .address_a(ROM_pc_address), .address_b(ROM_constant_address), .clock, .addressstall_a(stall), .addressstall_b(stall), .q_a(ROM_pc_data), .q_b(ROM_constant_data));
  agc_ram ram(.aclr(~reset_n), .clock, .data(RAM_write_data), .rd_addressstall(stall), .wraddress(RAM_write_address), .wren(RAM_write_en), .q(RAM_read_data), .rdaddress(RAM_read_address), .rden(1'b1));
  //IO_unit io(.clock, .reset_n, .IO_read_sel, .IO_write_data, .IO_read_data, .IO_write_en, .IO_write_sel);
  IO_register_file IO_unit (.data_write(IO_write_data),
                            .data_DSKY_VERB(DSKY_VERB_data),
                            .data_DSKY_NOUN(DSKY_NOUN_data),
                            .data_AXI_MISSION_TIME(AXI_MISSION_TIME_data),
                            .data_AXI_APOGEE(AXI_APOGEE_data),
                            .data_AXI_PERIGEE(AXI_PERIGEE_data),
                            .sel_read(IO_read_sel),
                            .sel_write(IO_write_sel),
                            .en_write(IO_write_en),
                            .rst_l(reset_n),
                            .clock(clock),
                            .data_read(IO_read_data)); 
  Core core(.clock, .reset_n, .ROM_pc_data, .ROM_constant_data, .RAM_read_data, .IO_read_data, .RAM_write_data, 
            .IO_write_data, .ROM_pc_address, .ROM_constant_address, .RAM_read_address, .RAM_write_address,
            .IO_read_sel, .IO_write_sel, .RAM_write_en, .stall, .halt, .IO_write_en);




  initial begin
    wait(halt);
    $finish;
  end
  

  initial begin
    #1000
    $finish;
  end
endmodule : TB
