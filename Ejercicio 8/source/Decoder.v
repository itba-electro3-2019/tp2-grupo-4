module Decoder(in,enable,out);
    input [3:0] in;
    input enable;
    //what are the output ports and their sizes.
    output reg [7:0] out;
    //Whenever there is a change in the in, execute the always block.
    always @(in or enable) begin
        if (enable == 0)    
            case (in)   //case statement. Check all the 8 combinations.
                4'b0000 :  out <= 7'b0000001;
                4'b0001 :  out <= 7'b1001111;
                4'b0010 :  out <= 7'b0010010;
                4'b0011 :  out <= 7'b0000110;
                4'b0100 :  out <= 7'b1001100;
                4'b0101 :  out <= 7'b0100100;
                4'b0110 :  out <= 7'b0100000;
                4'b0111 :  out <= 7'b0001111;
                4'b1000 :  out <= 7'b0000000;
                4'b1001 :  out <= 7'b0000100;
                4'b1010 :  out <= 7'b0001000;
                4'b1011 :  out <= 7'b1100000;
                4'b1100 :  out <= 7'b0110001;
                4'b1101 :  out <= 7'b1000010;
                4'b1110 :  out <= 7'b0110000;
                4'b1111 :  out <= 7'b0111000;
                //To make sure that latches are not created create a default value for output.
                default :  out <= 7'b0000000; 
            endcase
    end
endmodule