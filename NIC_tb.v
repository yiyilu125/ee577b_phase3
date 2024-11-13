module tb();
    // Declare inputs as regs and outputs as wires
    reg clk;
    reg reset;
    reg nicEn;
    reg nicWrEN;
    reg net_si;
    reg net_ro;
	reg net_polarity;
    reg [1:0] addr;
    reg [63:0] net_di;  // packet from router
    reg [63:0] d_in;    // packet from processor
	
    wire [63:0] d_out;   // packet to processor
    wire net_ri;         // input buffer ready signal
    wire net_so;         // output buffer has packet to send signal
    wire [63:0] net_do;  // packet to router

    // Instantiate the NIC module
    nic uut (
        .clk(clk),
        .reset(reset),
        .nicEn(nicEn),
        .nicWrEN(nicWrEN),
		.net_polarity(net_polarity),
        .net_si(net_si),
        .net_ro(net_ro),
        .addr(addr),
        .net_di(net_di),
        .d_in(d_in),
        .d_out(d_out),
        .net_ri(net_ri),
        .net_so(net_so),
        .net_do(net_do)
    );

    // Clock generation
    always #2 clk = ~clk;
	
	
	always @(posedge clk) 
	if (reset) 
	 begin
          net_polarity <= 1'b0; 
	 end
    else	
     begin
          net_polarity <= ~net_polarity;
     end
		
	
    initial begin
        // Initialize signals
		net_polarity=0;
        clk = 0;
        reset = 1;
        nicEn = 0;
        nicWrEN = 0;
        net_si = 0;
        net_ro = 0;
        addr = 2'b00;
        net_di = 64'h0;
        d_in = 64'h0;
		

        // Apply reset
        #4 reset = 0;

		// short test : NIC can receive two packets at same clock
		
		// NIC received 2 packet at same time
        net_si = 1;  // Router indicates a valid packet
        net_di = 64'h0EDCBA9876543210;  // Packet arrived from Router
        nicEn = 1;
        nicWrEN = 1;  // Write enable
		d_in = 64'h0BCD1234567890FF;  // Processor sends packet and it is even
        addr = 2'b10;  // Address for output channel buffer
		#4
		nicEn = 0;
        nicWrEN = 0;
		net_si = 0;  // Assumming that NIC received Packet
		
//------------------------------- From now there are two packet in buffers------------------------------------------------------------------------
		
        // send out packet simutaneously at same time 
        #4;
        net_ro = 1;
		nicEn = 1;	   
        nicWrEN = 0;   
		addr = 2'b00; 
		#4
		net_ro=0; // router is no space for new packet
		
		$finish;
	end
endmodule



