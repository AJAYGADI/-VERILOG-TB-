module tb_ring_counter;

  reg clk;               // Clock signal
  reg reset;             // Reset signal (active low)
  wire [3:0] count;      // 4-bit counter output

  // Instantiate the ring counter
  ring_counter uut (
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

    // Monitor and display counter values
    $display("Time=%t, Count=%b", $time, count);

    // Apply reset
    reset = 1;
    #10;                // Hold reset for 10 clock cycles
    reset = 0;

    // Shift the counter for 16 clock cycles
    repeat (16) begin
      #10;              // Shift the counter every 10 clock cycles
      $display("Time=%t, Count=%b", $time, count);
    end

    // End simulation
    $finish;
  end

endmodule
