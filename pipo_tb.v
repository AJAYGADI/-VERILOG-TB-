module pipo_register_tb;

  reg clk;               // Clock signal
  reg rst;               // Reset signal
  reg [3:0] parallel_in; // Parallel input
  wire [3:0] parallel_out; // Parallel output
  
  // Instantiate the PIPO register
  pipo_register dut (
    .clk(clk),
    .rst(rst),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  initial begin
    clk = 0;
    rst = 0;
    parallel_in = 0;
    
    // Reset the PIPO register
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
