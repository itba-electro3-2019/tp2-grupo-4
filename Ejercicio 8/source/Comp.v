module Comp(a,b,out);
    input [4:0] a,b;
    wire [4:0] y;
    output out;
    xnor(y[4],a[4],b[4]);
    xnor(y[3],a[3],b[3]);
    xnor(y[2],a[2],b[2]);
    xnor(y[1],a[1],b[1]);
    xnor(y[0],a[0],b[0]);
    and(out,y[0],y[1],y[2],y[3],y[4]);
endmodule
