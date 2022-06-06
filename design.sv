// Code your design here

`timescale 1ns/1ps
module PRPG_tb;
reg clk_tb;
reg load_tb;
reg din_tb;

initial
begin
    clk_tb = 0;
    din_tb = 4;
    load_tb = 1'b0;
end

always
begin
    #10 clk_tb = ~clk_tb;
end

initial
begin
    #30 load_tb = 1'b0;
    #80 load_tb = 1'b1;
    #5 load_tb = 1'b0;
    #250 $finish;
end

initial
begin
    $dumpfile("PRPG.vcd");
    $dumpvars(0, PRPG_tb);
end

PRPG PRPG_tb
(
    .clk(clk_tb),
   .load(load_tb)
);
endmodule