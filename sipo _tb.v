module sipo_shift_register_tb;

  reg clk;
  reg reset;
  reg serial_in;
  wire [3:0] parallel_out;

  // Instantiate the SIPO shift register
  sipo_shift_register uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
  );

  // Clock generation
  always begin
    clk = 0;
    #5; // Half clock period
    clk = 1;
    #5; // Half clock period
  end

  initial begin
    // Initialize inputs
    reset = 0;
    serial_in = 0;

    // Reset the SIPO shift register
    reset = 1;
    #10;
    reset = 0;

    // Test data input
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;

    // Check the parallel output
    if (parallel_out !== 4'b1010) begin
      $display("Test failed. Expected: 4'b1010, Got: %b", parallel_out);
    end else begin
      $display("Test passed. Parallel output: 4'b1010");
    end

    // Finish the simulation
    $finish;
  end

endmodule
