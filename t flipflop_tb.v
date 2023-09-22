`timescale 1ns / 1ps // Specify simulation timescale

module tb_t_flipflop;

  // Inputs
  reg T;
  reg clk;
  reg reset;

  // Outputs
  wire Q;

  // Instantiate the T flip-flop
  t_flipflop uut (
    .T(T),
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units (half period)
  end

  // Initial stimulus
  initial begin
    // Initialize inputs
    T = 0;
    clk = 0;
    reset = 0;

    // Apply test cases
    #10 T = 1; // Toggle input T high (Toggle Q)
    #10 T = 0; // Toggle input T low (No change to Q)
    #10 reset = 1; // Assert reset
    #10 reset = 0; // Deassert reset
    #10 T = 1; // Toggle input T high again

    // Check output
    $display("Q = %b", Q);

    // Finish simulation
    $finish;
  end

endmodule
