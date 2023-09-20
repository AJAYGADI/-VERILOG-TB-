module testbench;

  reg clk;               // Clock signal
  reg rst;               // Reset signal
  reg parallel_in;       // Parallel input
  wire serial_out;       // Serial output

  // Instantiate the PISO shift register
  piso_shift_register dut (
    .clk(clk),
    .rst(rst),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  initial begin
    clk = 0;
    rst = 0;
    parallel_in = 0;

    // Reset the PISO shift register
    rst = 1;
    #10 rst = 0;

    // Test case 1: Parallel input is '4'b1010'
    parallel_in = 4'b1010;
    #20;

    // Test case 2: Parallel input is '4'b1100'
    parallel_in = 4'b1100;
    #20;

    // Add more test cases here as needed

    $finish; // Terminate simulation
  end

endmodule
