`default_nettype none

`include "internal_defines.vh"
`include "core.sv"
`include "agc_rom_new/agc_rom_new.v"
`include "agc_ram/agc_ram.v"
`include "lib.sv"
`include "comp_units.sv"
`include "decode.sv"


module TB;
  logic clock, reset_n, uart_tx_busy, uart_tx_en;
  IO_reg_t read_sel;
  logic [7:0] uart_tx_data;
  logic [14:0] io_reg_data;

  assign io_reg_data = 15'o12345; 

  initial begin
    clock = 1'b0;
    reset_n = 1'b1;
    reset_n <= #1 1'b0;
    reset_n <= #2 1'b1;
    forever #5 clock = ~clock; 
  end

  initial begin
    uart_tx_busy = 1'b0;
    #5
    forever #10 uart_tx_busy = ~uart_tx_busy;
  end
 
  initial begin
    #50000
    $finish;
  end


  transmit_connector t1(.clock, .reset_n, .uart_tx_busy, .io_reg_data, .uart_tx_en, .read_sel, .uart_tx_data);


endmodule : TB
