module up_down_counter (
  input wire clk,             // Clock input
  input wire rst,             // Reset input (active low)
  input wire up,              // Up/Down control input
  output wire [2:0] count     // 3-bit counter output
);

  reg [2:0] count_reg;        // 3-bit counter register

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      count_reg <= 3'b000;    // Reset the counter to 0
    end else begin
      if (up) begin
        if (count_reg === 3'b111) begin
          count_reg <= 3'b000; // Wrap around to 0 after reaching 7
        end else begin
          count_reg <= count_reg + 1; // Increment the counter
        end
      end else begin
        if (count_reg === 3'b000) begin
          count_reg <= 3'b111; // Wrap around to 7 after reaching 0
        end else begin
          count_reg <= count_reg - 1; // Decrement the counter
        end
      end
    end
  end

  assign count = count_reg;   // Output is the counter register value

endmodule
