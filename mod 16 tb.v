module tb_mod16_counter;

  reg clk;               // Clock signal
  reg reset;             // Reset signal (active low)
  wire [3:0] count;      // 4-bit counter output

  // Instantiate the MOD-16 counter
  mod16_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
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

    // Reset the counter
    reset = 1;
    #10;                // Hold reset for 10 clock cycles
    reset = 0;

    // Monitor and display counter values
    repeat (20) begin
      #10;              // Increment the counter every 10 clock cycles
    end

    // End simulation
    $finish;
  end

endmodule
