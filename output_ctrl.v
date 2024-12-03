module opctrl (
    input clk,
    input reset,                        
    input polarity,                     // Polarity bit (0 for even, 1 for odd clock cycles)
    input [4:0] grant,                  // 5-bit one-hot signal from the arbiter
    input [63:0] data_in_pe,            // Data input from PE
    input [63:0] data_in_s,             // Data input from S
    input [63:0] data_in_n,             // Data input from N
    input [63:0] data_in_e,             // Data input from E
    input [63:0] data_in_w,             // Data input from W
    input receive_output,               // Indicates if the next level can receive data
    output reg [63:0] data_out,         // Selected data output
    output reg send_output,             // Indicates when data is valid and can be sent
    output reg empty,                   // Indicates when the current register is empty
    output reg clear_pe,                // Output clear signal for PE
    output reg clear_s,                 // Output clear signal for S
    output reg clear_n,                 // Output clear signal for N
    output reg clear_e,                 // Output clear signal for E
    output reg clear_w                  // Output clear signal for W
);

reg [63:0] mem_even;  // Storage for data when polarity = 0 (even clock cycles)
reg [63:0] mem_odd;   // Storage for data when polarity = 1 (odd clock cycles)
reg [4:0] clear;      // Indicates the direction from which the data is received
reg empty_even, empty_odd;

// State signal updates
always @(posedge clk) begin
    if (reset) begin
        empty_even <= 1;
        empty_odd <= 1;
        mem_even <= 0;
        mem_odd <= 0;
    end else begin
        // Update based on polarity
        if (polarity == 0) begin
            // Even clock cycle logic
            if (empty_even && grant != 5'b00000) begin
                case (grant)
                    5'b00001: mem_even <= data_in_pe;
                    5'b00010: mem_even <= data_in_s;
                    5'b00100: mem_even <= data_in_n;
                    5'b01000: mem_even <= data_in_e;
                    5'b10000: mem_even <= data_in_w;
                    default: begin
                        mem_even <= 0;
                        $display("ERROR: the grant signal is not one-hot!");
                    end
                endcase
                empty_even <= 0; // Set empty to low after receiving data
            end
            
            if (send_output) begin
                empty_odd <= 1;
            end
        end else begin
            // Odd clock cycle logic
            if (empty_odd && grant != 5'b00000) begin
                case (grant)
                    5'b00001: mem_odd <= data_in_pe;
                    5'b00010: mem_odd <= data_in_s;
                    5'b00100: mem_odd <= data_in_n;
                    5'b01000: mem_odd <= data_in_e;
                    5'b10000: mem_odd <= data_in_w;
                    default: begin
                        mem_odd <= 0;
                        $display("Arbiter output error: the grant signal is not one-hot!");
                    end
                endcase
                empty_odd <= 0; // Set empty to low after receiving data
            end

            if (send_output) begin
                empty_even <= 1;
            end
        end
    end
end

always @(*) begin
    clear_pe = clear[0];
    clear_s = clear[1];
    clear_n = clear[2];
    clear_e = clear[3];
    clear_w = clear[4];
end

always @(*) begin
    data_out = 0;
    send_output = 0;

    // Determine output data and status based on polarity and empty signals
    if (receive_output) begin
        if (polarity == 0 && ~empty_odd) begin
            data_out = mem_odd;
            send_output = 1;
        end else if (polarity == 1 && ~empty_even) begin
            data_out = mem_even;
            send_output = 1;
        end
    end
end

// Update clear and empty signals based on the current polarity and empty status
always @(*) begin
    empty = (polarity == 0) ? empty_even : empty_odd; 
    clear = empty ? grant : 0;
end

endmodule
