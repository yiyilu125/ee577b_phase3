module cardinal_cmp #(

)(
    input clk, reset,
);

//wire 
wire polarity;

//mesh
mesh4x4 #(
    .DATA_WIDTH(64),
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
nic_pe_module npm00(
    .clk(clk),
    .reset(reset),
    .net_so(),
    .net_ro(),
    .net_do(),
    .net_polarity(polarity),
    .net_si(),
    .net_ri(),
    .net_di(),
    
    //DMeme, IMem
    .inst_in(),
    .d_in(),
    .pc_out(),
    .d_out(),
    .addr_out(),
    .memWrEn(),
    .memEn()
);

endmodule