module Countbcd ( clk,enable, out);    // Declare 4-bit output port to get the counter values
    input clk,enable;
    output reg[3:0] out = 4'b0000;
  // This always block will be triggered at the rising edge of clk (0->1)
  // Once inside this block, it checks if the reset is 0, if yes then change out to zero
  // If reset is 1, then design should be allowed to count up, so increment counter
    always @ (posedge clk) begin
        if (enable == 1)
            if (out == 4'b1111)
                out <= 0;
            else if(out == 4'b1001)
                out <= 0;
            else 
                out <= out + 1;
    end
endmodule