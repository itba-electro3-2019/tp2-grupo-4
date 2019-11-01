//Defino tiempo de la simulacion
`timescale 100ms / 100ms
module main;
//Signal definitions
    wire Triang_cuad,Rst,Comparador,Cmp,Enable,Clk_2K,Enot;
    wire [4:0] ToComp, In;
    wire [3:0] BCDtoDisp_1, BCDtoDisp_2;
    wire [7:0] Out_1,Out_2;
    wire No1,No2,Anres;
//Calling function to generate signal
    Gen_TritoCua clkt_gen(Triang_cuad);
    In deffreq(In);
    Gen_Com ComRam(Cmp);
    Gen_Clk clk(Clk_2K);
//logica intermedia
    Countbit counter1(Triang_cuad,Rst, ToComp);
    Comp compara(In,ToComp,Comparador);
    and(Rst,1,Comparador);
    and(Enable,Cmp,Comparador);
    Countbcd count1(Clk_2K,Enable,BCDtoDisp_1);
    not(No1,BCDtoDisp_1[1]);
    not(No2,BCDtoDisp_1[2]);
    and(Anres,No1,No2,BCDtoDisp_1[0],BCDtoDisp_1[3]);
    Countbcd count2(Clk_2K,Anres,BCDtoDisp_2);
    not(Enot,Enable);
    Decoder dec1(BCDtoDisp_1,Enot,Out_1);
    Decoder dec2(BCDtoDisp_2,Enot,Out_2);
//Begin simulation
    initial begin
        #10
        $finish;
    end
//Seting path to get data for visualization of simulation
    reg dummy;
    reg[8*64:0] dumpfile_path = "output.vcd";
    initial begin
        dummy= $value$plusargs("VCD_PATH=%s", dumpfile_path);
        $dumpfile(dumpfile_path);
        $dumpvars(0,main);
    end
endmodule