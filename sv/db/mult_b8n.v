//lpm_mult CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEVICE_FAMILY="Cyclone V" DSP_BLOCK_BALANCING="Auto" LPM_REPRESENTATION="UNSIGNED" LPM_WIDTHA=14 LPM_WIDTHB=14 LPM_WIDTHP=28 MAXIMIZE_SPEED=5 dataa datab result CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 16.1 cbx_cycloneii 2017:01:11:18:30:33:SJ cbx_lpm_add_sub 2017:01:11:18:30:33:SJ cbx_lpm_mult 2017:01:11:18:30:33:SJ cbx_mgl 2017:01:11:19:37:47:SJ cbx_nadder 2017:01:11:18:30:33:SJ cbx_padd 2017:01:11:18:30:33:SJ cbx_stratix 2017:01:11:18:30:33:SJ cbx_stratixii 2017:01:11:18:30:33:SJ cbx_util_mgl 2017:01:11:18:30:33:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2017  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Intel and sold by Intel or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mult_b8n
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [13:0]  dataa;
	input   [13:0]  datab;
	output   [27:0]  result;

	wire [13:0]    dataa_wire;
	wire [13:0]    datab_wire;
	wire [27:0]    result_wire;



	assign dataa_wire = dataa;
	assign datab_wire = datab;
	assign result_wire = dataa_wire * datab_wire;
	assign result = ({result_wire[27:0]});

endmodule //mult_b8n
//VALID FILE
