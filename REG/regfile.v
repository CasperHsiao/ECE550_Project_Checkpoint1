module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
<<<<<<< HEAD
	
	wire [31:0] write_oneHot, write_enable, readA_oneHot, readB_oneHot;
	wire [31:0] q_reg0 [31:0];
	tri [31:0] data_readRegA, data_readRegB;

	// Write port
	decoder writeDecoder(ctrl_writeReg, write_oneHot);
=======

	// Write port	
	wire [31:0] write_oneHot, write_enable;
	wire [31:0] tristatewire;
	wire [31:0] q_reg0, q_reg1, q_reg2, q_reg3, q_reg4, q_reg5, q_reg6, q_reg7, q_reg8, q_reg9, q_reg10, q_reg11, q_reg12,
	 q_reg13, q_reg14, q_reg15, q_reg16, q_reg17, q_reg18, q_reg19, q_reg20, q_reg21, q_reg22, q_reg23, q_reg24, q_reg25,
	  q_reg26, q_reg27, q_reg28, q_reg29, q_reg30, q_reg31;
	
	assign switch = clock || ctrl_reset;
	
	decoder decoderWrite(ctrl_writeReg, write_oneHot);
>>>>>>> 4a7bf67a8a877a2e88a861872bed45cf0fa02596
	genvar i;
	generate
		for (i = 0; i < 32; i = i+1)
		begin : and_loop
			and andEnable(write_enable[i], write_oneHot[i], ctrl_writeEnable);
		end
	endgenerate
	
<<<<<<< HEAD
	generate
		for (i = 1; i < 32; i = i+1)
		begin : write_loop
			register reg1(q_reg0[i], data_writeReg, clock, write_enable[i], ctrl_reset);
		end
	endgenerate
	
	register reg0(q_reg0[0], data_writeReg, clock, write_enable[0], 1'b1);
	
	// Read Port
	decoder readDecoderA(ctrl_readRegA,readA_oneHot);
	
	generate
		for (i = 0; i < 32; i = i+1)
		begin : tristate_buffer_loop
			triBuff readA(.out(data_readRegA), .in(q_reg0[i]), .ctrl(readA_oneHot[i]));
		end
	endgenerate
	
	
	
	decoder readDecoderB(ctrl_readRegB,readB_oneHot);

	generate
		for (i = 0; i < 32; i = i+1)
		begin : tristate_buffer_loop_B
			triBuff readB(.out(data_readRegB), .in(q_reg0[i]), .ctrl(readB_oneHot[i]));
		end
	endgenerate
=======
	register reg0(q_reg0, data_writeReg, clock, write_enable[0], 1'b1);
	register reg1(q_reg1, data_writeReg, clock, write_enable[1], ctrl_reset);
	register reg2(q_reg2, data_writeReg, clock, write_enable[2], ctrl_reset);
	register reg3(q_reg3, data_writeReg, clock, write_enable[3], ctrl_reset);
	register reg4(q_reg4, data_writeReg, clock, write_enable[4], ctrl_reset);
	register reg5(q_reg5, data_writeReg, clock, write_enable[5], ctrl_reset);
	register reg6(q_reg6, data_writeReg, clock, write_enable[6], ctrl_reset);
	register reg7(q_reg7, data_writeReg, clock, write_enable[7], ctrl_reset);
	register reg8(q_reg8, data_writeReg, clock, write_enable[8], ctrl_reset);
	register reg9(q_reg9, data_writeReg, clock, write_enable[9], ctrl_reset);
	register reg10(q_reg10, data_writeReg, clock, write_enable[10], ctrl_reset);
	register reg11(q_reg11, data_writeReg, clock, write_enable[11], ctrl_reset);
	register reg12(q_reg12, data_writeReg, clock, write_enable[12], ctrl_reset);
	register reg13(q_reg13, data_writeReg, clock, write_enable[13], ctrl_reset);
	register reg14(q_reg14, data_writeReg, clock, write_enable[14], ctrl_reset);
	register reg15(q_reg15, data_writeReg, clock, write_enable[15], ctrl_reset);
	register reg16(q_reg16, data_writeReg, clock, write_enable[16], ctrl_reset);
	register reg17(q_reg17, data_writeReg, clock, write_enable[17], ctrl_reset);
	register reg18(q_reg18, data_writeReg, clock, write_enable[18], ctrl_reset);
	register reg19(q_reg19, data_writeReg, clock, write_enable[19], ctrl_reset);
	register reg20(q_reg20, data_writeReg, clock, write_enable[20], ctrl_reset);
	register reg21(q_reg21, data_writeReg, clock, write_enable[21], ctrl_reset);
	register reg22(q_reg22, data_writeReg, clock, write_enable[22], ctrl_reset);
	register reg23(q_reg23, data_writeReg, clock, write_enable[23], ctrl_reset);
	register reg24(q_reg24, data_writeReg, clock, write_enable[24], ctrl_reset);
	register reg25(q_reg25, data_writeReg, clock, write_enable[25], ctrl_reset);
	register reg26(q_reg26, data_writeReg, clock, write_enable[26], ctrl_reset);
	register reg27(q_reg27, data_writeReg, clock, write_enable[27], ctrl_reset);
	register reg28(q_reg28, data_writeReg, clock, write_enable[28], ctrl_reset);
	register reg29(q_reg29, data_writeReg, clock, write_enable[29], ctrl_reset);
	register reg30(q_reg30, data_writeReg, clock, write_enable[30], ctrl_reset);
	register reg31(q_reg31, data_writeReg, clock, write_enable[31], ctrl_reset);
	
	// Read port A
	wire [31:0] readA_oneHot;
	decoder decoderReadA(ctrl_readRegA, readA_oneHot);
	assign tristatewire = readA_oneHot[0] ? q_reg0 : 1'bz;
	assign tristatewire = readA_oneHot[1] ? q_reg1: 1'bz;
//	assign data_readRegA = tristatewire;
//	assign data_readRegA = readA_oneHot[2] ? q_reg2 : 1'bz;
//	assign data_readRegA = readA_oneHot[3] ? q_reg3 : 1'bz;
//	assign data_readRegA = readA_oneHot[4] ? q_reg4 : 1'bz;
//	assign data_readRegA = readA_oneHot[5] ? q_reg5 : 1'bz;
//	assign data_readRegA = readA_oneHot[6] ? q_reg6 : 1'bz;
//	assign data_readRegA = readA_oneHot[7] ? q_reg7 : 1'bz;
//	assign data_readRegA = readA_oneHot[8] ? q_reg8 : 1'bz;
//	assign data_readRegA = readA_oneHot[9] ? q_reg9 : 1'bz;
//	assign data_readRegA = readA_oneHot[10] ? q_reg10 : 1'bz;
//	assign data_readRegA = readA_oneHot[11] ? q_reg1: 1'bz;
//	assign data_readRegA = readA_oneHot[12] ? q_reg2 : 1'bz;
//	assign data_readRegA = readA_oneHot[13] ? q_reg3 : 1'bz;
//	assign data_readRegA = readA_oneHot[14] ? q_reg4 : 1'bz;
//	assign data_readRegA = readA_oneHot[15] ? q_reg5 : 1'bz;
//	assign data_readRegA = readA_oneHot[16] ? q_reg6 : 1'bz;
//	assign data_readRegA = readA_oneHot[17] ? q_reg7 : 1'bz;
//	assign data_readRegA = readA_oneHot[18] ? q_reg8 : 1'bz;
//	assign data_readRegA = readA_oneHot[19] ? q_reg9 : 1'bz;
//	assign data_readRegA = readA_oneHot[20] ? q_reg0 : 1'bz;
//	assign data_readRegA = readA_oneHot[21] ? q_reg1: 1'bz;
//	assign data_readRegA = readA_oneHot[22] ? q_reg2 : 1'bz;
//	assign data_readRegA = readA_oneHot[23] ? q_reg3 : 1'bz;
//	assign data_readRegA = readA_oneHot[24] ? q_reg4 : 1'bz;
//	assign data_readRegA = readA_oneHot[25] ? q_reg5 : 1'bz;
//	assign data_readRegA = readA_oneHot[26] ? q_reg6 : 1'bz;
//	assign data_readRegA = readA_oneHot[27] ? q_reg7 : 1'bz;
//	assign data_readRegA = readA_oneHot[28] ? q_reg8 : 1'bz;
//	assign data_readRegA = readA_oneHot[29] ? q_reg9 : 1'bz;
//	assign data_readRegA = readA_oneHot[30] ? q_reg10 : 1'bz;
//	assign data_readRegA = readA_oneHot[31] ? q_reg1: 1'bz;

>>>>>>> 4a7bf67a8a877a2e88a861872bed45cf0fa02596
	

endmodule
