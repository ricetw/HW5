// Code your testbench here
// or browse Examples
module PRPG(clk,load);

input clk;
input load;
output [2:0] din;
output [2:0] Q_out;
output Q1, Q2, Q3;

reg [2:0] din;
reg [2:0] Q_out;
reg Q1, Q2, Q3;
reg temp;

initial
begin
    temp = 0;
    Q1 = 1;
    Q2 = 0;
    Q3 = 0;
    Q_out = 3'b001;
    din = 3'b111;
end

  always@ (posedge clk or posedge load)
begin
  if(load)
    begin
        Q1 = din[0];
        Q2 = din[1];
        Q3 = din[2];
    end

    else
    begin
        temp = Q1;
        Q1 = Q1 ^ Q3;
        Q3 = Q2;
        Q2 = temp;
    end

    Q_out[0] = Q1;
    Q_out[1] = Q2;
    Q_out[2] = Q3;
end
endmodule