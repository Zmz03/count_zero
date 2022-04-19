`timescale 1ns/1ns

module count_zero_tb();

parameter width = 8;

reg clk;
reg  [width -1: 0] i_data;
wire [width/2 -1: 0] o;

count_zero count_zero_0(
    .clk(clk),
    .i_data(i_data),
    .o(o)
);

initial begin
    clk = 0;
    i_data = 0;
end

always #20 clk = ~clk;
always #40 i_data = i_data + 1;


endmodule