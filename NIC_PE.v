module nic_pe_module (
    input clk,
    input reset,
    output net_so,
    input net_ro,
    output [63:0]net_do,
    input net_polarity,
    input net_si,
    output net_ri,
    input [63:0]net_di,
    
  
    input [31:0]inst_in,  //instruction input 
    input [63:0] d_in,   //  input fill from DMEM
    output [31:0]pc_out, // program counter
    output [63:0]d_out,  // output dump  to DMEM
    output [31:0]addr_out, // DMEM address
    output memWrEn,
    output memEn
);





wire [63:0]nic_PE_data;
wire [63:0]PE_nic_data;
wire nicEn_w;
wire nicEnWr_w;
wire [1:0]adder_nic_w;




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
	.rst(reset),
	.imem_instruction(inst_in), // instruction input 
	.dmem_dataOut(d_in),       //  data from DMEM: fill
	.nic_dataOut(nic_PE_data),//  nic -----> PE DATA
	.imem_address(pc_out),   // address access with IMEM
	.dmem_address(addr_out), //address access with DMEM
	.store_enable(memWrEn),// store enable
	.mem_enable(memEn), // memory enable
	.nicEn(nicEn_w),//  nicEnable
	.nicEnWr(nicEnWr_w), // nicWrEnable
	.adder_nic(adder_nic_w), // define
	.nic_dataIn(PE_nic_data),//define // PE----->nic DATA
	.dmem_dataIn(d_out)    // data to DMEM: dump
	);

endmodule 