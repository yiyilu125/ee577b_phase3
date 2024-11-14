module nic_pe_module (
    input clk,
    input reset,
    output net_so,
    input net_ro,
    output net_do,
    input net_polarity,
    input net_si,
    output net_ri,
    input net_di,
    
  
    input [31:0]inst_in,
    input [63:0] d_in,  //  input fill from DMEM
    output [31:0]pc_out, // program counter
    output [63:0]d_out,// output dump  to DMEM
    output [31:0]addr_out, // DMEM address
    output memWrEn,
    output memEn
);





wire nic_PE_data;
wire PE_nic_data;
wire nicEn_w;
wire nicEnWr_w;
wire adder_nic_w;




	 nic  nic1 (
    .clk(clk),        
    .reset(reset), 	
    .nicEn(nicEn_w),         // enable
    .nicWrEN(nicEnWr_w),       // write enable
	.net_polarity(net_polarity),  // count of number of clocks
	.net_si(net_si),        // channel data is a valid packet
    .net_ro(net_ro),        // indicates the router has space for a new packet. 
	.addr(adder_nic_w),    // address to indicate register in NIC
    .net_di(net_di), // packet from router
	.d_in(PE_nic_data),   // packet from PE
    .d_out(nic_PE_data),   // packet to PE
	.net_ri(net_ri),         // when the network input channel buffer is empty. 
    .net_so(net_so),         // when the channel buffer has packet to send 
    .net_do(net_do)  // packet to router
);



	pipeline  pp1 (
	.clk(clk), 
	.reset(reset),
	.imem_instruction(inst_in),
	.dmem_dataOut(d_in),
	.nic_dataOut(nic_PE_data),// define nic -----> PE DATA
	.imem_address(pc_out),
	.dmem_address(addr_out),
	.store_enable(memWrEn),
	.mem_enable(memEn),
	.nicEn(nicEn_w),// define
	.nicEnWr(nicEnWr_w), // define
	.adder_nic(adder_nic_w), // define
	.nic_dataIn(PE_nic_data)//define // PE----->nic DATA
	);

endmodule 