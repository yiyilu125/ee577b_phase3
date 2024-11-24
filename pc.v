module program_counter (
    input clk,                     // Clock signal
    input reset,                   // Synchronous reset signal
    input branch_en,               // Branch enable signal to trigger a jump to branch_target
    input [15:0] branch_target,    // Target address for branching (16-bit)
    output reg [31:0] ins_address  // Current instruction address (32-bit)
);

    always @(posedge clk) begin 
        if (reset) begin
            ins_address <= 32'b0;
        end else if (branch_en) begin
            // If branch is enabled, jump to the branch target address
            ins_address <= branch_target;
        end else if (ins_address < 32'b0000_0000_0000_0000_0000_0011_1111_1100) begin
            // If counter haven't reach the last instruction, fetch the next instruction
            ins_address <= ins_address + 4;
        end
    end

endmodule
