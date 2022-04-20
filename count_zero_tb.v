`timescale 1ns/1ns

module count_zero_tb();

reg  [3 : 0] i_data;
wire [3 : 0] o;

count_zero count_zero_0(
    .i_data(i_data),
    .o(o)
);

initial begin
    i_data = 0;
end

always #40 i_data = i_data + 1;


endmodule