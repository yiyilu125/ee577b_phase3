/*we use this HDU module to generate the signal for forwarding mux select signal. When the current read
  address is not $0 and it is equal to the previous distination, it will set the signal to high. Then it
  will forward the data.*/
module hdu # (
    parameter REG_ADDRESS_LENGTH = 5,
    parameter OPCODE_LENGTH = 5
)(
    input [REG_ADDRESS_LENGTH-1:0] current_RA, current_RB, Lasttime_RD,
    output mux_ctrl_rA,
    output mux_ctrl_rB
);
    assign mux_ctrl_rA = (Lasttime_RD != 5'b0 && current_RA == Lasttime_RD) ? 1 : 0;
    assign mux_ctrl_rB = (Lasttime_RD != 5'b0 && current_RB == Lasttime_RD) ? 1 : 0;
endmodule
