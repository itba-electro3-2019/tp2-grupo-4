module Countbit ( clk,rst, out);    // Declare 4-bit output port to get the counter values
    input clk,rst;
    output reg[4:0] out = 5'b00000;
  // This always block will be triggered at the rising edge of clk (0->1)
  // Once inside this block, it checks if the reset is 0, if yes then change out to zero
  // If reset is 1, then design should be allowed to count up, so increment counter
  always @ (posedge clk) begin
    if (out == 5'b11111)
        out <= 0;
    else if (rst==1)
        out <= 0;
    else 
        out <= out + 1;
  end
endmodule