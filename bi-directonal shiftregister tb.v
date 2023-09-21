module tb_bidirectional_shift_register;

  reg clk;               // Clock signal
  reg reset;             // Reset signal
  reg shift_left;        // Shift left control
  reg shift_right;       // Shift right control
  reg [3:0] data_in;     // Input data
  wire [3:0] data_out;   // Output data

  // Instantiate the bidirectional shift register
  bidirectional_shift_register uut (
    .clk(clk),
    .reset(reset),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    clk = ~clk;          // Toggle the clock every time step
    #5;                 // Delay for half a clock cycle
  end

  // Test scenario
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 0;
    shift_left = 0;
    shift_right = 0;
    data_in = 4'b0001;

    // Reset the shift register
    reset = 1;
    #10;                // Hold reset for 10 clock cycles
    reset = 0;

    // Test shifting left
    shift_left = 1;
    #20;                // Shift left for 20 clock cycles

    // Test shifting right
    shift_left = 0;
    shift_right = 1;
    #20;                // Shift right for 20 clock cycles

    // End simulation
    $finish;
  end

endmodule
