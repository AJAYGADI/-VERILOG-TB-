module tb_async_up_counter;

  reg clk;               // Clock signal
  reg rst;               // Reset signal (active low)
  wire [2:0] count;      // Counter output

  // Instantiate the asynchronous up-counter
  async_up_counter uut (
    .clk(clk),
    .rst(rst),
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
    rst = 0;

    // Reset the counter
    rst = 1;
    #10;                // Hold reset for 10 clock cycles
    rst = 0;

    // Monitor and display counter values
    $display("Time=%t, Count=%b", $time, count);

    // Count for a few clock cycles
    #30;

    // End simulation
    $finish;
  end

endmodule
