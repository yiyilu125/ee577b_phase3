module cardinal_cmp #(
    parameter INSTRUCTION_WIDTH = 32,
    parameter DATA_WIDTH = 64,
    parameter PC_WIDTH = 32,
    parameter DMEM_ADDRESS_WIDTH = 32
)(
    input clk, reset,
    input [INSTRUCTION_WIDTH-1:0] inst_in_00, inst_in_01, inst_in_02, inst_in_03,
                                   inst_in_10, inst_in_11, inst_in_12, inst_in_13,
                                   inst_in_20, inst_in_21, inst_in_22, inst_in_23,
                                   inst_in_30, inst_in_31, inst_in_32, inst_in_33,
    input [DATA_WIDTH-1:0] d_in_00, d_in_01, d_in_02, d_in_03,
                           d_in_10, d_in_11, d_in_12, d_in_13,
                           d_in_20, d_in_21, d_in_22, d_in_23,
                           d_in_30, d_in_31, d_in_32, d_in_33,
    output [PC_WIDTH-1:0] pc_out_00, pc_out_01, pc_out_02, pc_out_03,
                          pc_out_10, pc_out_11, pc_out_12, pc_out_13,
                          pc_out_20, pc_out_21, pc_out_22, pc_out_23,
                          pc_out_30, pc_out_31, pc_out_32, pc_out_33,
    output [DATA_WIDTH-1:0] d_out_00, d_out_01, d_out_02, d_out_03,
                            d_out_10, d_out_11, d_out_12, d_out_13,
                            d_out_20, d_out_21, d_out_22, d_out_23,
                            d_out_30, d_out_31, d_out_32, d_out_33,
    output [DMEM_ADDRESS_WIDTH-1:0] addr_out_00, addr_out_01, addr_out_02, addr_out_03,
                                    addr_out_10, addr_out_11, addr_out_12, addr_out_13,
                                    addr_out_20, addr_out_21, addr_out_22, addr_out_23,
                                    addr_out_30, addr_out_31, addr_out_32, addr_out_33,
    output memWrEn_00, memWrEn_01, memWrEn_02, memWrEn_03,
           memWrEn_10, memWrEn_11, memWrEn_12, memWrEn_13,
           memWrEn_20, memWrEn_21, memWrEn_22, memWrEn_23,
           memWrEn_30, memWrEn_31, memWrEn_32, memWrEn_33,
    output memE_00, memE_01, memE_02, memE_03,
           memE_10, memE_11, memE_12, memE_13,
           memE_20, memE_21, memE_22, memE_23,
           memE_30, memE_31, memE_32, memE_33

);

//wire 
wire polarity;
wire pesi_00, peri_00, pero_00, peso_00;
wire [DATA_WIDTH-1:0] pedi_00, pedo_00;

wire pesi_01, peri_01, pero_01, peso_01;
wire [DATA_WIDTH-1:0] pedi_01, pedo_01;

wire pesi_02, peri_02, pero_02, peso_02;
wire [DATA_WIDTH-1:0] pedi_02, pedo_02;

wire pesi_03, peri_03, pero_03, peso_03;
wire [DATA_WIDTH-1:0] pedi_03, pedo_03;

wire pesi_10, peri_10, pero_10, peso_10;
wire [DATA_WIDTH-1:0] pedi_10, pedo_10;

wire pesi_11, peri_11, pero_11, peso_11;
wire [DATA_WIDTH-1:0] pedi_11, pedo_11;

wire pesi_12, peri_12, pero_12, peso_12;
wire [DATA_WIDTH-1:0] pedi_12, pedo_12;

wire pesi_13, peri_13, pero_13, peso_13;
wire [DATA_WIDTH-1:0] pedi_13, pedo_13;

wire pesi_20, peri_20, pero_20, peso_20;
wire [DATA_WIDTH-1:0] pedi_20, pedo_20;

wire pesi_21, peri_21, pero_21, peso_21;
wire [DATA_WIDTH-1:0] pedi_21, pedo_21;

wire pesi_22, peri_22, pero_22, peso_22;
wire [DATA_WIDTH-1:0] pedi_22, pedo_22;

wire pesi_23, peri_23, pero_23, peso_23;
wire [DATA_WIDTH-1:0] pedi_23, pedo_23;

wire pesi_30, peri_30, pero_30, peso_30;
wire [DATA_WIDTH-1:0] pedi_30, pedo_30;

wire pesi_31, peri_31, pero_31, peso_31;
wire [DATA_WIDTH-1:0] pedi_31, pedo_31;

wire pesi_32, peri_32, pero_32, peso_32;
wire [DATA_WIDTH-1:0] pedi_32, pedo_32;

wire pesi_33, peri_33, pero_33, peso_33;
wire [DATA_WIDTH-1:0] pedi_33, pedo_33;


//mesh
mesh4x4 #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(1)
)mesh(
    .clk(clk),
    .reset(reset),
    .polarity(polarity),
    .pesi_r0 (pesi_00), .pedi_r0 (pedi_00), .peri_r0 (peri_00), .pero_r0 (pero_00), .pedo_r0 (pedo_00), .peso_r0 (peso_00),
    .pesi_r4 (pesi_01), .pedi_r4 (pedi_01), .peri_r4 (peri_01), .pero_r4 (pero_01), .pedo_r4 (pedo_01), .peso_r4 (peso_01),
    .pesi_r8 (pesi_02), .pedi_r8 (pedi_02), .peri_r8 (peri_02), .pero_r8 (pero_02), .pedo_r8 (pedo_02), .peso_r8 (peso_02),
    .pesi_r12(pesi_03), .pedi_r12(pedi_03), .peri_r12(peri_03), .pero_r12(pero_03), .pedo_r12(pedo_03), .peso_r12(peso_03),
    .pesi_r1 (pesi_10), .pedi_r1 (pedi_10), .peri_r1 (peri_10), .pero_r1 (pero_10), .pedo_r1 (pedo_10), .peso_r1 (peso_10),
    .pesi_r5 (pesi_11), .pedi_r5 (pedi_11), .peri_r5 (peri_11), .pero_r5 (pero_11), .pedo_r5 (pedo_11), .peso_r5 (peso_11),
    .pesi_r9 (pesi_12), .pedi_r9 (pedi_12), .peri_r9 (peri_12), .pero_r9 (pero_12), .pedo_r9 (pedo_12), .peso_r9 (peso_12),
    .pesi_r13(pesi_13), .pedi_r13(pedi_13), .peri_r13(peri_13), .pero_r13(pero_13), .pedo_r13(pedo_13), .peso_r13(peso_13),
    .pesi_r2 (pesi_20), .pedi_r2 (pedi_20), .peri_r2 (peri_20), .pero_r2 (pero_20), .pedo_r2 (pedo_20), .peso_r2 (peso_20),
    .pesi_r6 (pesi_21), .pedi_r6 (pedi_21), .peri_r6 (peri_21), .pero_r6 (pero_21), .pedo_r6 (pedo_21), .peso_r6 (peso_21),
    .pesi_r10(pesi_22), .pedi_r10(pedi_22), .peri_r10(peri_22), .pero_r10(pero_22), .pedo_r10(pedo_22), .peso_r10(peso_22),
    .pesi_r14(pesi_23), .pedi_r14(pedi_23), .peri_r14(peri_23), .pero_r14(pero_23), .pedo_r14(pedo_23), .peso_r14(peso_23),
    .pesi_r3 (pesi_30), .pedi_r3 (pedi_30), .peri_r3 (peri_30), .pero_r3 (pero_30), .pedo_r3 (pedo_30), .peso_r3 (peso_30),
    .pesi_r7 (pesi_31), .pedi_r7 (pedi_31), .peri_r7 (peri_31), .pero_r7 (pero_31), .pedo_r7 (pedo_31), .peso_r7 (peso_31),
    .pesi_r11(pesi_32), .pedi_r11(pedi_32), .peri_r11(peri_32), .pero_r11(pero_32), .pedo_r11(pedo_32), .peso_r11(peso_32),
    .pesi_r15(pesi_33), .pedi_r15(pedi_33), .peri_r15(peri_33), .pero_r15(pero_33), .pedo_r15(pedo_33), .peso_r15(peso_33)
);

// nic_pe_module npm00(
//     .clk(clk),
//     .reset(reset),
//     .net_so(pesi_00),
//     .net_ro(peri_00),
//     .net_do(pedi_00),
//     .net_polarity(polarity),
//     .net_si(peso_00),
//     .net_ri(pero_00),
//     .net_di(pedo_00),
    
//     //DMeme, IMem
//     .inst_in(inst_in_00),
//     .d_in(d_in_00),
//     .pc_out(pc_out_00),
//     .d_out(d_out_00),
//     .addr_out(addr_out_00),
//     .memWrEn(memWrEn_00),
//     .memEn(memEn_00)
// );

nic_pe_module npm00 (.clk(clk), .reset(reset), .net_so(pesi_00), .net_ro(peri_00), .net_do(pedi_00), .net_polarity(polarity), .net_si(peso_00), .net_ri(pero_00), .net_di(pedo_00), .inst_in(inst_in_00), .d_in(d_in_00), .pc_out(pc_out_00), .d_out(d_out_00), .addr_out(addr_out_00), .memWrEn(memWrEn_00), .memEn(memE_00));
nic_pe_module npm01 (.clk(clk), .reset(reset), .net_so(pesi_01), .net_ro(peri_01), .net_do(pedi_01), .net_polarity(polarity), .net_si(peso_01), .net_ri(pero_01), .net_di(pedo_01), .inst_in(inst_in_01), .d_in(d_in_01), .pc_out(pc_out_01), .d_out(d_out_01), .addr_out(addr_out_01), .memWrEn(memWrEn_01), .memEn(memE_01));
nic_pe_module npm02 (.clk(clk), .reset(reset), .net_so(pesi_02), .net_ro(peri_02), .net_do(pedi_02), .net_polarity(polarity), .net_si(peso_02), .net_ri(pero_02), .net_di(pedo_02), .inst_in(inst_in_02), .d_in(d_in_02), .pc_out(pc_out_02), .d_out(d_out_02), .addr_out(addr_out_02), .memWrEn(memWrEn_02), .memEn(memE_02));
nic_pe_module npm03 (.clk(clk), .reset(reset), .net_so(pesi_03), .net_ro(peri_03), .net_do(pedi_03), .net_polarity(polarity), .net_si(peso_03), .net_ri(pero_03), .net_di(pedo_03), .inst_in(inst_in_03), .d_in(d_in_03), .pc_out(pc_out_03), .d_out(d_out_03), .addr_out(addr_out_03), .memWrEn(memWrEn_03), .memEn(memE_03));
nic_pe_module npm10 (.clk(clk), .reset(reset), .net_so(pesi_10), .net_ro(peri_10), .net_do(pedi_10), .net_polarity(polarity), .net_si(peso_10), .net_ri(pero_10), .net_di(pedo_10), .inst_in(inst_in_10), .d_in(d_in_10), .pc_out(pc_out_10), .d_out(d_out_10), .addr_out(addr_out_10), .memWrEn(memWrEn_10), .memEn(memE_10));
nic_pe_module npm11 (.clk(clk), .reset(reset), .net_so(pesi_11), .net_ro(peri_11), .net_do(pedi_11), .net_polarity(polarity), .net_si(peso_11), .net_ri(pero_11), .net_di(pedo_11), .inst_in(inst_in_11), .d_in(d_in_11), .pc_out(pc_out_11), .d_out(d_out_11), .addr_out(addr_out_11), .memWrEn(memWrEn_11), .memEn(memE_11));
nic_pe_module npm12 (.clk(clk), .reset(reset), .net_so(pesi_12), .net_ro(peri_12), .net_do(pedi_12), .net_polarity(polarity), .net_si(peso_12), .net_ri(pero_12), .net_di(pedo_12), .inst_in(inst_in_12), .d_in(d_in_12), .pc_out(pc_out_12), .d_out(d_out_12), .addr_out(addr_out_12), .memWrEn(memWrEn_12), .memEn(memE_12));
nic_pe_module npm13 (.clk(clk), .reset(reset), .net_so(pesi_13), .net_ro(peri_13), .net_do(pedi_13), .net_polarity(polarity), .net_si(peso_13), .net_ri(pero_13), .net_di(pedo_13), .inst_in(inst_in_13), .d_in(d_in_13), .pc_out(pc_out_13), .d_out(d_out_13), .addr_out(addr_out_13), .memWrEn(memWrEn_13), .memEn(memE_13));
nic_pe_module npm20 (.clk(clk), .reset(reset), .net_so(pesi_20), .net_ro(peri_20), .net_do(pedi_20), .net_polarity(polarity), .net_si(peso_20), .net_ri(pero_20), .net_di(pedo_20), .inst_in(inst_in_20), .d_in(d_in_20), .pc_out(pc_out_20), .d_out(d_out_20), .addr_out(addr_out_20), .memWrEn(memWrEn_20), .memEn(memE_20));
nic_pe_module npm21 (.clk(clk), .reset(reset), .net_so(pesi_21), .net_ro(peri_21), .net_do(pedi_21), .net_polarity(polarity), .net_si(peso_21), .net_ri(pero_21), .net_di(pedo_21), .inst_in(inst_in_21), .d_in(d_in_21), .pc_out(pc_out_21), .d_out(d_out_21), .addr_out(addr_out_21), .memWrEn(memWrEn_21), .memEn(memE_21));
nic_pe_module npm22 (.clk(clk), .reset(reset), .net_so(pesi_22), .net_ro(peri_22), .net_do(pedi_22), .net_polarity(polarity), .net_si(peso_22), .net_ri(pero_22), .net_di(pedo_22), .inst_in(inst_in_22), .d_in(d_in_22), .pc_out(pc_out_22), .d_out(d_out_22), .addr_out(addr_out_22), .memWrEn(memWrEn_22), .memEn(memE_22));
nic_pe_module npm23 (.clk(clk), .reset(reset), .net_so(pesi_23), .net_ro(peri_23), .net_do(pedi_23), .net_polarity(polarity), .net_si(peso_23), .net_ri(pero_23), .net_di(pedo_23), .inst_in(inst_in_23), .d_in(d_in_23), .pc_out(pc_out_23), .d_out(d_out_23), .addr_out(addr_out_23), .memWrEn(memWrEn_23), .memEn(memE_23));
nic_pe_module npm30 (.clk(clk), .reset(reset), .net_so(pesi_30), .net_ro(peri_30), .net_do(pedi_30), .net_polarity(polarity), .net_si(peso_30), .net_ri(pero_30), .net_di(pedo_30), .inst_in(inst_in_30), .d_in(d_in_30), .pc_out(pc_out_30), .d_out(d_out_30), .addr_out(addr_out_30), .memWrEn(memWrEn_30), .memEn(memE_30));
nic_pe_module npm31 (.clk(clk), .reset(reset), .net_so(pesi_31), .net_ro(peri_31), .net_do(pedi_31), .net_polarity(polarity), .net_si(peso_31), .net_ri(pero_31), .net_di(pedo_31), .inst_in(inst_in_31), .d_in(d_in_31), .pc_out(pc_out_31), .d_out(d_out_31), .addr_out(addr_out_31), .memWrEn(memWrEn_31), .memEn(memE_31));
nic_pe_module npm32 (.clk(clk), .reset(reset), .net_so(pesi_32), .net_ro(peri_32), .net_do(pedi_32), .net_polarity(polarity), .net_si(peso_32), .net_ri(pero_32), .net_di(pedo_32), .inst_in(inst_in_32), .d_in(d_in_32), .pc_out(pc_out_32), .d_out(d_out_32), .addr_out(addr_out_32), .memWrEn(memWrEn_32), .memEn(memE_32));
nic_pe_module npm33 (.clk(clk), .reset(reset), .net_so(pesi_33), .net_ro(peri_33), .net_do(pedi_33), .net_polarity(polarity), .net_si(peso_33), .net_ri(pero_33), .net_di(pedo_33), .inst_in(inst_in_33), .d_in(d_in_33), .pc_out(pc_out_33), .d_out(d_out_33), .addr_out(addr_out_33), .memWrEn(memWrEn_33), .memEn(memE_33));



endmodule