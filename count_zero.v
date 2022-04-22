//module_name: count_zero
//date       : 2022.4.17
//author     : Zmz03
//description: count the number of 0 before 1 in one data, for example 
//count 0010_1001 is 2.

module count_zero (
    i_data,
    o
);


input  [3  : 0] i_data;

output reg [3 : 0] o;

wire   [3  : 0] i_data_n;
reg    [3  : 0] data_t;

assign i_data_n = ~i_data;

always @(*)begin
    data_t[3] = i_data_n[3];
    data_t[2] = i_data_n[2] & data_t[3];
    data_t[1] = i_data_n[1] & data_t[2];
    data_t[0] = i_data_n[0] & data_t[1];

    o = data_t[0] + data_t[1] + data_t[2] + data_t[3];
end
    
endmodule