//Es la señal cuadrada formada a partir de la negación de la triangular

//Los skips aceptan hasta 1 decimal
`timescale 1ms / 100us
module Gen_TritoCua(clk);
    parameter PERIOD=50;
    output reg clk;
    always
        begin: CLOCK_DRIVER
            clk <= 1'b1;
            #(PERIOD/2);
            clk <= 1'b0;
            #(PERIOD/2);
        end
endmodule