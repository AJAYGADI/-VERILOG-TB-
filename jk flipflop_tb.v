`timescale 1ns / 1ps // Specify simulation timescale

module tb_jk_flipflop;

  // Inputs
  reg J;
  reg K;
  reg clk;

  // Outputs
  wire Q;

  // Instantiate the JK flip-flop
  jk_flipflop uut (
    .J(J),
    .K(K),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units (half period)
  end

  // Initial stimulus
  initial begin
    // Initialize inputs
    J = 0;
    K = 0;
    clk = 0;

    // Apply test cases
    #10 J = 1; // Set J input high (Toggle the state)
    #10 K = 1; // Set K input high (Toggle the state)
    #10 J = 0; // Set J input low (Set the state to 1)
    #10 K = 0; // Set K input low (Set the state to 0)

    // Check output
    $display("Q = %b", Q);

    // Finish simulation
    $finish;
  end

endmodule
