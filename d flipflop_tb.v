`timescale 1ns / 1ps // Specify simulation timescale

module tb_d_flipflop;

  // Inputs
  reg D;
  reg clk;
  reg reset;

  // Outputs
  wire Q;

  // Instantiate the D flip-flop
  d_flipflop uut (
    .D(D),
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
    D = 0;
    clk = 0;
    reset = 0;

    // Apply test cases
    #10 D = 1; // Set D input high
    #10 D = 0; // Set D input low
    #10 reset = 1; // Assert reset
    #10 reset = 0; // Deassert reset
    #10 D = 1; // Set D input high again

    // Check output
    $display("Q = %b", Q);

    // Finish simulation
    $finish;
  end

endmodule
