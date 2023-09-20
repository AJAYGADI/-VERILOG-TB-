module tb_siso_shift_register;

    reg clk;            // Clock input
    reg reset;          // Reset input
    reg shift_left;     // Shift left control input
    reg shift_right;    // Shift right control input
    reg data_in;        // Serial data input
    wire data_out;      // Serial data output

    // Instantiate the SISO Shift Register
    siso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock Generation
    always begin
        #5 clk = ~clk; // Toggle the clock every 5 time units
    end

    // Testbench Stimulus
    initial begin
        clk = 0;
        reset = 0;
        shift_left = 0;
        shift_right = 0;
        data_in = 1'b0;

        // Test Case 1: Shift right with data input 1
        data_in = 1'b1;
        shift_right = 1;
        #10 shift_right = 0;
        #10 shift_right = 1;
        #10 shift_right = 0;

        // Test Case 2: Shift left with data input 0
        data_in = 1'b0;
        shift_left = 1;
        #10 shift_left = 0;
        #10 shift_left = 1;
        #10 shift_left = 0;

        // Test Case 3: Reset and shift right with data input 1
        reset = 1;
        #10 reset = 0;
        data_in = 1'b1;
        shift_right = 1;
        #10 shift_right = 0;

        $finish; // End simulation
    end

endmodule
