`timescale 1ns/10ps

// Include Memory Files
`include "./include/dmem.v"
`include "./include/imem.v"
`include "./include/gscl45nm.v"

module tb_cmp;

parameter clk_cycle = 4;
reg CLK, RESET;

// Node 0
wire [0:31] node0_pc_out;
wire [0:31] node0_inst_in;
wire [0:31] node0_addr_out;
wire [0:63] node0_d_out, node0_d_in;
wire node0_memEn, node0_memWrEn;
wire [0:1] node0_addr_nic;
wire [0:63] node0_din_nic, node0_dout_nic;
wire node0_nicEn, node0_nicWrEn;

// Node 1
wire [0:31] node1_pc_out;
wire [0:31] node1_inst_in;
wire [0:31] node1_addr_out;
wire [0:63] node1_d_out, node1_d_in;
wire node1_memEn, node1_memWrEn;
wire [0:1] node1_addr_nic;
wire [0:63] node1_din_nic, node1_dout_nic;
wire node1_nicEn, node1_nicWrEn;

// Node 2
wire [0:31] node2_pc_out;
wire [0:31] node2_inst_in;
wire [0:31] node2_addr_out;
wire [0:63] node2_d_out, node2_d_in;
wire node2_memEn, node2_memWrEn;
wire [0:1] node2_addr_nic;
wire [0:63] node2_din_nic, node2_dout_nic;
wire node2_nicEn, node2_nicWrEn;

// Node 3
wire [0:31] node3_pc_out;
wire [0:31] node3_inst_in;
wire [0:31] node3_addr_out;
wire [0:63] node3_d_out, node3_d_in;
wire node3_memEn, node3_memWrEn;
wire [0:1] node3_addr_nic;
wire [0:63] node3_din_nic, node3_dout_nic;
wire node3_nicEn, node3_nicWrEn;

// Node 4
wire [0:31] node4_pc_out;
wire [0:31] node4_inst_in;
wire [0:31] node4_addr_out;
wire [0:63] node4_d_out, node4_d_in;
wire node4_memEn, node4_memWrEn;
wire [0:1] node4_addr_nic;
wire [0:63] node4_din_nic, node4_dout_nic;
wire node4_nicEn, node4_nicWrEn;

// Node 5
wire [0:31] node5_pc_out;
wire [0:31] node5_inst_in;
wire [0:31] node5_addr_out;
wire [0:63] node5_d_out, node5_d_in;
wire node5_memEn, node5_memWrEn;
wire [0:1] node5_addr_nic;
wire [0:63] node5_din_nic, node5_dout_nic;
wire node5_nicEn, node5_nicWrEn;

// Node 6
wire [0:31] node6_pc_out;
wire [0:31] node6_inst_in;
wire [0:31] node6_addr_out;
wire [0:63] node6_d_out, node6_d_in;
wire node6_memEn, node6_memWrEn;
wire [0:1] node6_addr_nic;
wire [0:63] node6_din_nic, node6_dout_nic;
wire node6_nicEn, node6_nicWrEn;

// Node 7
wire [0:31] node7_pc_out;
wire [0:31] node7_inst_in;
wire [0:31] node7_addr_out;
wire [0:63] node7_d_out, node7_d_in;
wire node7_memEn, node7_memWrEn;
wire [0:1] node7_addr_nic;
wire [0:63] node7_din_nic, node7_dout_nic;
wire node7_nicEn, node7_nicWrEn;

// Node 8
wire [0:31] node8_pc_out;
wire [0:31] node8_inst_in;
wire [0:31] node8_addr_out;
wire [0:63] node8_d_out, node8_d_in;
wire node8_memEn, node8_memWrEn;
wire [0:1] node8_addr_nic;
wire [0:63] node8_din_nic, node8_dout_nic;
wire node8_nicEn, node8_nicWrEn;

// Node 9
wire [0:31] node9_pc_out;
wire [0:31] node9_inst_in;
wire [0:31] node9_addr_out;
wire [0:63] node9_d_out, node9_d_in;
wire node9_memEn, node9_memWrEn;
wire [0:1] node9_addr_nic;
wire [0:63] node9_din_nic, node9_dout_nic;
wire node9_nicEn, node9_nicWrEn;

// Node 10
wire [0:31] node10_pc_out;
wire [0:31] node10_inst_in;
wire [0:31] node10_addr_out;
wire [0:63] node10_d_out, node10_d_in;
wire node10_memEn, node10_memWrEn;
wire [0:1] node10_addr_nic;
wire [0:63] node10_din_nic, node10_dout_nic;
wire node10_nicEn, node10_nicWrEn;

// Node 11
wire [0:31] node11_pc_out;
wire [0:31] node11_inst_in;
wire [0:31] node11_addr_out;
wire [0:63] node11_d_out, node11_d_in;
wire node11_memEn, node11_memWrEn;
wire [0:1] node11_addr_nic;
wire [0:63] node11_din_nic, node11_dout_nic;
wire node11_nicEn, node11_nicWrEn;

// Node 12
wire [0:31] node12_pc_out;
wire [0:31] node12_inst_in;
wire [0:31] node12_addr_out;
wire [0:63] node12_d_out, node12_d_in;
wire node12_memEn, node12_memWrEn;
wire [0:1] node12_addr_nic;
wire [0:63] node12_din_nic, node12_dout_nic;
wire node12_nicEn, node12_nicWrEn;

// Node 13
wire [0:31] node13_pc_out;
wire [0:31] node13_inst_in;
wire [0:31] node13_addr_out;
wire [0:63] node13_d_out, node13_d_in;
wire node13_memEn, node13_memWrEn;
wire [0:1] node13_addr_nic;
wire [0:63] node13_din_nic, node13_dout_nic;
wire node13_nicEn, node13_nicWrEn;

// Node 14
wire [0:31] node14_pc_out;
wire [0:31] node14_inst_in;
wire [0:31] node14_addr_out;
wire [0:63] node14_d_out, node14_d_in;
wire node14_memEn, node14_memWrEn;
wire [0:1] node14_addr_nic;
wire [0:63] node14_din_nic, node14_dout_nic;
wire node14_nicEn, node14_nicWrEn;

// Node 15
wire [0:31] node15_pc_out;
wire [0:31] node15_inst_in;
wire [0:31] node15_addr_out;
wire [0:63] node15_d_out, node15_d_in;
wire node15_memEn, node15_memWrEn;
wire [0:1] node15_addr_nic;
wire [0:63] node15_din_nic, node15_dout_nic;
wire node15_nicEn, node15_nicWrEn;



integer dmem0_dump_file;      // Channel Descriptor for DMEM0 final dump
integer dmem1_dump_file;      // Channel Descriptor for DMEM1 final dump
integer dmem2_dump_file;      // Channel Descriptor for DMEM2 final dump
integer dmem3_dump_file;      // Channel Descriptor for DMEM3 final dump
integer dmem4_dump_file;      // Channel Descriptor for DMEM4 final dump
integer dmem5_dump_file;      // Channel Descriptor for DMEM5 final dump
integer dmem6_dump_file;      // Channel Descriptor for DMEM6 final dump
integer dmem7_dump_file;      // Channel Descriptor for DMEM7 final dump
integer dmem8_dump_file;      // Channel Descriptor for DMEM8 final dump
integer dmem9_dump_file;      // Channel Descriptor for DMEM9 final dump
integer dmem10_dump_file;     // Channel Descriptor for DMEM10 final dump
integer dmem11_dump_file;     // Channel Descriptor for DMEM11 final dump
integer dmem12_dump_file;     // Channel Descriptor for DMEM12 final dump
integer dmem13_dump_file;     // Channel Descriptor for DMEM13 final dump
integer dmem14_dump_file;     // Channel Descriptor for DMEM14 final dump
integer dmem15_dump_file;     // Channel Descriptor for DMEM15 final dump
integer i;
integer cycle_number;

//// ******************** Module Instantiations ******************** \\\\

// Instruction Memory Instance
imem IM_node0 (
    .memAddr        (node0_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node0_inst_in)           // 32-bit Instruction
    );

imem IM_node1 (
    .memAddr        (node1_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node1_inst_in)           // 32-bit Instruction
    );

imem IM_node2 (
    .memAddr        (node2_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node2_inst_in)           // 32-bit Instruction
    );

imem IM_node3 (
    .memAddr        (node3_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node3_inst_in)           // 32-bit Instruction
    );

imem IM_node4 (
    .memAddr        (node4_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node4_inst_in)           // 32-bit Instruction
    );

imem IM_node5 (
    .memAddr        (node5_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node5_inst_in)           // 32-bit Instruction
    );

imem IM_node6 (
    .memAddr        (node6_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node6_inst_in)           // 32-bit Instruction
    );

imem IM_node7 (
    .memAddr        (node7_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node7_inst_in)           // 32-bit Instruction
    );

imem IM_node8 (
    .memAddr        (node8_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node8_inst_in)           // 32-bit Instruction
    );

imem IM_node9 (
    .memAddr        (node9_pc_out[22:29]),    // Only 8-bits are used in this project
    .dataOut        (node9_inst_in)           // 32-bit Instruction
    );

imem IM_node10 (
    .memAddr        (node10_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node10_inst_in)          // 32-bit Instruction
    );

imem IM_node11 (
    .memAddr        (node11_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node11_inst_in)          // 32-bit Instruction
    );

imem IM_node12 (
    .memAddr        (node12_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node12_inst_in)          // 32-bit Instruction
    );

imem IM_node13 (
    .memAddr        (node13_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node13_inst_in)          // 32-bit Instruction
    );

imem IM_node14 (
    .memAddr        (node14_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node14_inst_in)          // 32-bit Instruction
    );

imem IM_node15 (
    .memAddr        (node15_pc_out[22:29]),   // Only 8-bits are used in this project
    .dataOut        (node15_inst_in)          // 32-bit Instruction
    );



// Data Memory Instance
// DM_node0
dmem DM_node0 (
    .clk        (CLK),                  // System Clock
    .memEn      (node0_memEn),          // data-memory enable (to avoid spurious reads)
    .memWrEn    (node0_memWrEn),        // data-memory Write Enable
    .memAddr    (node0_addr_out[24:31]), // 8-bit Memory address
    .dataIn     (node0_d_out),          // 64-bit data to data-memory
    .dataOut    (node0_d_in)            // 64-bit data from data-memory
);

dmem DM_node1 (
    .clk        (CLK),
    .memEn      (node1_memEn),
    .memWrEn    (node1_memWrEn),
    .memAddr    (node1_addr_out[24:31]),
    .dataIn     (node1_d_out),
    .dataOut    (node1_d_in)
);

dmem DM_node2 (
    .clk        (CLK),
    .memEn      (node2_memEn),
    .memWrEn    (node2_memWrEn),
    .memAddr    (node2_addr_out[24:31]),
    .dataIn     (node2_d_out),
    .dataOut    (node2_d_in)
);

dmem DM_node3 (
    .clk        (CLK),
    .memEn      (node3_memEn),
    .memWrEn    (node3_memWrEn),
    .memAddr    (node3_addr_out[24:31]),
    .dataIn     (node3_d_out),
    .dataOut    (node3_d_in)
);

dmem DM_node4 (
    .clk        (CLK),
    .memEn      (node4_memEn),
    .memWrEn    (node4_memWrEn),
    .memAddr    (node4_addr_out[24:31]),
    .dataIn     (node4_d_out),
    .dataOut    (node4_d_in)
);

dmem DM_node5 (
    .clk        (CLK),
    .memEn      (node5_memEn),
    .memWrEn    (node5_memWrEn),
    .memAddr    (node5_addr_out[24:31]),
    .dataIn     (node5_d_out),
    .dataOut    (node5_d_in)
);

dmem DM_node6 (
    .clk        (CLK),
    .memEn      (node6_memEn),
    .memWrEn    (node6_memWrEn),
    .memAddr    (node6_addr_out[24:31]),
    .dataIn     (node6_d_out),
    .dataOut    (node6_d_in)
);

dmem DM_node7 (
    .clk        (CLK),
    .memEn      (node7_memEn),
    .memWrEn    (node7_memWrEn),
    .memAddr    (node7_addr_out[24:31]),
    .dataIn     (node7_d_out),
    .dataOut    (node7_d_in)
);

dmem DM_node8 (
    .clk        (CLK),
    .memEn      (node8_memEn),
    .memWrEn    (node8_memWrEn),
    .memAddr    (node8_addr_out[24:31]),
    .dataIn     (node8_d_out),
    .dataOut    (node8_d_in)
);

dmem DM_node9 (
    .clk        (CLK),
    .memEn      (node9_memEn),
    .memWrEn    (node9_memWrEn),
    .memAddr    (node9_addr_out[24:31]),
    .dataIn     (node9_d_out),
    .dataOut    (node9_d_in)
);

dmem DM_node10 (
    .clk        (CLK),
    .memEn      (node10_memEn),
    .memWrEn    (node10_memWrEn),
    .memAddr    (node10_addr_out[24:31]),
    .dataIn     (node10_d_out),
    .dataOut    (node10_d_in)
);

dmem DM_node11 (
    .clk        (CLK),
    .memEn      (node11_memEn),
    .memWrEn    (node11_memWrEn),
    .memAddr    (node11_addr_out[24:31]),
    .dataIn     (node11_d_out),
    .dataOut    (node11_d_in)
);

dmem DM_node12 (
    .clk        (CLK),
    .memEn      (node12_memEn),
    .memWrEn    (node12_memWrEn),
    .memAddr    (node12_addr_out[24:31]),
    .dataIn     (node12_d_out),
    .dataOut    (node12_d_in)
);

dmem DM_node13 (
    .clk        (CLK),
    .memEn      (node13_memEn),
    .memWrEn    (node13_memWrEn),
    .memAddr    (node13_addr_out[24:31]),
    .dataIn     (node13_d_out),
    .dataOut    (node13_d_in)
);

dmem DM_node14 (
    .clk        (CLK),
    .memEn      (node14_memEn),
    .memWrEn    (node14_memWrEn),
    .memAddr    (node14_addr_out[24:31]),
    .dataIn     (node14_d_out),
    .dataOut    (node14_d_in)
);

dmem DM_node15 (
    .clk        (CLK),                  // System Clock
    .memEn      (node15_memEn),         // data-memory enable (to avoid spurious reads)
    .memWrEn    (node15_memWrEn),       // data-memory Write Enable
    .memAddr    (node15_addr_out[24:31]), // 8-bit Memory address
    .dataIn     (node15_d_out),         // 64-bit data to data-memory
    .dataOut    (node15_d_in)           // 64-bit data from data-memory
);
	
cardinal_cmp CMP(
    .clk(CLK),
    .reset(RESET),
    
    .inst_in_00  (node0_inst_in  ),
    .d_in_00     (node0_d_in     ),
    .pc_out_00   (node0_pc_out   ),
    .d_out_00    (node0_d_out    ),
    .addr_out_00 (node0_addr_out ),
    .memWrEn_00  (node0_memWrEn  ),
    .memE_00     (node0_memEn    ),

    .inst_in_10  (node1_inst_in  ),
    .d_in_10     (node1_d_in     ),
    .pc_out_10   (node1_pc_out   ),
    .d_out_10    (node1_d_out    ),
    .addr_out_10 (node1_addr_out ),
    .memWrEn_10  (node1_memWrEn  ),
    .memE_10     (node1_memEn    ),

    .inst_in_20  (node2_inst_in  ),
    .d_in_20     (node2_d_in     ),
    .pc_out_20   (node2_pc_out   ),
    .d_out_20    (node2_d_out    ),
    .addr_out_20 (node2_addr_out ),
    .memWrEn_20  (node2_memWrEn  ),
    .memE_20     (node2_memEn    ),

    .inst_in_30  (node3_inst_in  ),
    .d_in_30     (node3_d_in     ),
    .pc_out_30   (node3_pc_out   ),
    .d_out_30    (node3_d_out    ),
    .addr_out_30 (node3_addr_out ),
    .memWrEn_30  (node3_memWrEn  ),
    .memE_30     (node3_memEn    ),

    .inst_in_01  (node4_inst_in  ),
    .d_in_01     (node4_d_in     ),
    .pc_out_01   (node4_pc_out   ),
    .d_out_01    (node4_d_out    ),
    .addr_out_01 (node4_addr_out ),
    .memWrEn_01  (node4_memWrEn  ),
    .memE_01     (node4_memEn    ),

    .inst_in_11  (node5_inst_in  ),
    .d_in_11     (node5_d_in     ),
    .pc_out_11   (node5_pc_out   ),
    .d_out_11    (node5_d_out    ),
    .addr_out_11 (node5_addr_out ),
    .memWrEn_11  (node5_memWrEn  ),
    .memE_11     (node5_memEn    ),

    .inst_in_21  (node6_inst_in  ),
    .d_in_21     (node6_d_in     ),
    .pc_out_21   (node6_pc_out   ),
    .d_out_21    (node6_d_out    ),
    .addr_out_21 (node6_addr_out ),
    .memWrEn_21  (node6_memWrEn  ),
    .memE_21     (node6_memEn    ),

    .inst_in_31  (node7_inst_in  ),
    .d_in_31     (node7_d_in     ),
    .pc_out_31   (node7_pc_out   ),
    .d_out_31    (node7_d_out    ),
    .addr_out_31 (node7_addr_out ),
    .memWrEn_31  (node7_memWrEn  ),
    .memE_31     (node7_memEn    ),

    .inst_in_02  (node8_inst_in  ),
    .d_in_02     (node8_d_in     ),
    .pc_out_02   (node8_pc_out   ),
    .d_out_02    (node8_d_out    ),
    .addr_out_02 (node8_addr_out ),
    .memWrEn_02  (node8_memWrEn  ),
    .memE_02     (node8_memEn    ),

    .inst_in_12  (node9_inst_in  ),
    .d_in_12     (node9_d_in     ),
    .pc_out_12   (node9_pc_out   ),
    .d_out_12    (node9_d_out    ),
    .addr_out_12 (node9_addr_out ),
    .memWrEn_12  (node9_memWrEn  ),
    .memE_12     (node9_memEn    ),

    .inst_in_22  (node10_inst_in ),
    .d_in_22     (node10_d_in    ),
    .pc_out_22   (node10_pc_out  ),
    .d_out_22    (node10_d_out   ),
    .addr_out_22 (node10_addr_out),
    .memWrEn_22  (node10_memWrEn ),
    .memE_22     (node10_memEn   ),

    .inst_in_32  (node11_inst_in ),
    .d_in_32     (node11_d_in    ),
    .pc_out_32   (node11_pc_out  ),
    .d_out_32    (node11_d_out   ),
    .addr_out_32 (node11_addr_out),
    .memWrEn_32  (node11_memWrEn ),
    .memE_32     (node11_memEn   ),

    .inst_in_03  (node12_inst_in ),
    .d_in_03     (node12_d_in    ),
    .pc_out_03   (node12_pc_out  ),
    .d_out_03    (node12_d_out   ),
    .addr_out_03 (node12_addr_out),
    .memWrEn_03  (node12_memWrEn ),
    .memE_03     (node12_memEn   ),

    .inst_in_13  (node13_inst_in ),
    .d_in_13     (node13_d_in    ),
    .pc_out_13   (node13_pc_out  ),
    .d_out_13    (node13_d_out   ),
    .addr_out_13 (node13_addr_out),
    .memWrEn_13  (node13_memWrEn ),
    .memE_13     (node13_memEn   ),

    .inst_in_23  (node14_inst_in ),
    .d_in_23     (node14_d_in    ),
    .pc_out_23   (node14_pc_out  ),
    .d_out_23    (node14_d_out   ),
    .addr_out_23 (node14_addr_out),
    .memWrEn_23  (node14_memWrEn ),
    .memE_23     (node14_memEn   ),

    .inst_in_33  (node15_inst_in ),
    .d_in_33     (node15_d_in    ),
    .pc_out_33   (node15_pc_out  ),
    .d_out_33    (node15_d_out   ),
    .addr_out_33 (node15_addr_out),
    .memWrEn_33  (node15_memWrEn ),
    .memE_33     (node15_memEn   )
);
	
always #(clk_cycle / 2) CLK <= ~CLK;	

initial begin
    #50000
    $finish;
end
	
initial
begin
	$readmemh("imem_core0.fill", IM_node0.MEM);  // loading instruction memory into node0
	$readmemh("imem_core1.fill", IM_node1.MEM);  // loading instruction memory into node1
	$readmemh("imem_core2.fill", IM_node2.MEM);  // loading instruction memory into node2
	$readmemh("imem_core3.fill", IM_node3.MEM);  // loading instruction memory into node3
	$readmemh("imem_core4.fill", IM_node4.MEM);  // loading instruction memory into node4
	$readmemh("imem_core5.fill", IM_node5.MEM);  // loading instruction memory into node5
	$readmemh("imem_core6.fill", IM_node6.MEM);  // loading instruction memory into node6
	$readmemh("imem_core7.fill", IM_node7.MEM);  // loading instruction memory into node7
	$readmemh("imem_core8.fill", IM_node8.MEM);  // loading instruction memory into node8
	$readmemh("imem_core9.fill", IM_node9.MEM);  // loading instruction memory into node9
	$readmemh("imem_core10.fill", IM_node10.MEM); // loading instruction memory into node10
	$readmemh("imem_core11.fill", IM_node11.MEM); // loading instruction memory into node11
	$readmemh("imem_core12.fill", IM_node12.MEM); // loading instruction memory into node12
	$readmemh("imem_core13.fill", IM_node13.MEM); // loading instruction memory into node13
	$readmemh("imem_core14.fill", IM_node14.MEM); // loading instruction memory into node14
	$readmemh("imem_core15.fill", IM_node15.MEM); // loading instruction memory into node15

    $readmemh("dmem_core0.fill", DM_node0.MEM);  // loading data memory into node0
    $readmemh("dmem_core1.fill", DM_node1.MEM);  // loading data memory into node1
    $readmemh("dmem_core2.fill", DM_node2.MEM);  // loading data memory into node2
    $readmemh("dmem_core3.fill", DM_node3.MEM);  // loading data memory into node3
    $readmemh("dmem_core4.fill", DM_node4.MEM);  // loading data memory into node4
    $readmemh("dmem_core5.fill", DM_node5.MEM);  // loading data memory into node5
    $readmemh("dmem_core6.fill", DM_node6.MEM);  // loading data memory into node6
    $readmemh("dmem_core7.fill", DM_node7.MEM);  // loading data memory into node7
    $readmemh("dmem_core8.fill", DM_node8.MEM);  // loading data memory into node8
    $readmemh("dmem_core9.fill", DM_node9.MEM);  // loading data memory into node9
    $readmemh("dmem_core10.fill", DM_node10.MEM); // loading data memory into node10
    $readmemh("dmem_core11.fill", DM_node11.MEM); // loading data memory into node11
    $readmemh("dmem_core12.fill", DM_node12.MEM); // loading data memory into node12
    $readmemh("dmem_core13.fill", DM_node13.MEM); // loading data memory into node13
    $readmemh("dmem_core14.fill", DM_node14.MEM); // loading data memory into node14
    $readmemh("dmem_core15.fill", DM_node15.MEM); // loading data memory into node15

	
	CLK <= 0;				// initialize Clock
	RESET <= 1'b1;				// reset the CPU 
	repeat(5) @(negedge CLK);		// wait for 5 clock cycles
	RESET <= 1'b0;				// de-activate reset signal after 5ns

	// Convention for the last instruction
	// We would have a last instruction NOP  => 32'h00000000
	//wait (node0_inst_in == 32'h00000000 && node1_inst_in == 32'h00000000 && node2_inst_in == 32'h00000000 && node3_inst_in == 32'h00000000);
	wait (node0_inst_in == 32'h00000000 );
	// Let us see how much did you stall
	$display("The program completed in %d cycles", cycle_number);
	// Let us now flush the pipe line
	repeat(5) @(negedge CLK); 
	// Open file for output
	dmem0_dump_file = $fopen("cmp_test.dmem0.dump");  // assigning the channel descriptor for output file
	dmem1_dump_file = $fopen("cmp_test.dmem1.dump");  // assigning the channel descriptor for output file
	dmem2_dump_file = $fopen("cmp_test.dmem2.dump");  // assigning the channel descriptor for output file
	dmem3_dump_file = $fopen("cmp_test.dmem3.dump");  // assigning the channel descriptor for output file
	dmem4_dump_file = $fopen("cmp_test.dmem4.dump");  // assigning the channel descriptor for output file
	dmem5_dump_file = $fopen("cmp_test.dmem5.dump");  // assigning the channel descriptor for output file
	dmem6_dump_file = $fopen("cmp_test.dmem6.dump");  // assigning the channel descriptor for output file
	dmem7_dump_file = $fopen("cmp_test.dmem7.dump");  // assigning the channel descriptor for output file
	dmem8_dump_file = $fopen("cmp_test.dmem8.dump");  // assigning the channel descriptor for output file
	dmem9_dump_file = $fopen("cmp_test.dmem9.dump");  // assigning the channel descriptor for output file
	dmem10_dump_file = $fopen("cmp_test.dmem10.dump"); // assigning the channel descriptor for output file
	dmem11_dump_file = $fopen("cmp_test.dmem11.dump"); // assigning the channel descriptor for output file
	dmem12_dump_file = $fopen("cmp_test.dmem12.dump"); // assigning the channel descriptor for output file
	dmem13_dump_file = $fopen("cmp_test.dmem13.dump"); // assigning the channel descriptor for output file
	dmem14_dump_file = $fopen("cmp_test.dmem14.dump"); // assigning the channel descriptor for output file
	dmem15_dump_file = $fopen("cmp_test.dmem15.dump"); // assigning the channel descriptor for output file

	// Let us now dump all the locations of the data memory now
	for (i = 0; i < 128; i = i + 1) begin
		$fdisplay(dmem0_dump_file, "Memory location #%d : %h ", i, DM_node0.MEM[i]);
		$fdisplay(dmem1_dump_file, "Memory location #%d : %h ", i, DM_node1.MEM[i]);
		$fdisplay(dmem2_dump_file, "Memory location #%d : %h ", i, DM_node2.MEM[i]);
		$fdisplay(dmem3_dump_file, "Memory location #%d : %h ", i, DM_node3.MEM[i]);
		$fdisplay(dmem4_dump_file, "Memory location #%d : %h ", i, DM_node4.MEM[i]);
		$fdisplay(dmem5_dump_file, "Memory location #%d : %h ", i, DM_node5.MEM[i]);
		$fdisplay(dmem6_dump_file, "Memory location #%d : %h ", i, DM_node6.MEM[i]);
		$fdisplay(dmem7_dump_file, "Memory location #%d : %h ", i, DM_node7.MEM[i]);
		$fdisplay(dmem8_dump_file, "Memory location #%d : %h ", i, DM_node8.MEM[i]);
		$fdisplay(dmem9_dump_file, "Memory location #%d : %h ", i, DM_node9.MEM[i]);
		$fdisplay(dmem10_dump_file, "Memory location #%d : %h ", i, DM_node10.MEM[i]);
		$fdisplay(dmem11_dump_file, "Memory location #%d : %h ", i, DM_node11.MEM[i]);
		$fdisplay(dmem12_dump_file, "Memory location #%d : %h ", i, DM_node12.MEM[i]);
		$fdisplay(dmem13_dump_file, "Memory location #%d : %h ", i, DM_node13.MEM[i]);
		$fdisplay(dmem14_dump_file, "Memory location #%d : %h ", i, DM_node14.MEM[i]);
		$fdisplay(dmem15_dump_file, "Memory location #%d : %h ", i, DM_node15.MEM[i]);
	end

	$fclose(dmem0_dump_file);
	$fclose(dmem1_dump_file);
	$fclose(dmem2_dump_file);
	$fclose(dmem3_dump_file);
	$fclose(dmem4_dump_file);
	$fclose(dmem5_dump_file);
	$fclose(dmem6_dump_file);
	$fclose(dmem7_dump_file);
	$fclose(dmem8_dump_file);
	$fclose(dmem9_dump_file);
	$fclose(dmem10_dump_file);
	$fclose(dmem11_dump_file);
	$fclose(dmem12_dump_file);
	$fclose(dmem13_dump_file);
	$fclose(dmem14_dump_file);
	$fclose(dmem15_dump_file);
	$finish;
	
end // initial begin
	
//// ******************** Cycle Counter ******************** \\\\

always @ (posedge CLK)
begin
	if (RESET)
		cycle_number <= 0;
	else
		cycle_number <= cycle_number + 1;
end

endmodule

