//Los skips aceptan hasta 1 decimal
`timescale 10us / 10us
module Gen_Clk(clk);
    parameter PERIOD=50;
    output reg clk;
    always
        begin: CLOCK_DRIVER
            clk <= 1'b0;
            #(PERIOD/2);
            clk <= 1'b1;
            #(PERIOD/2);
        end
endmodule