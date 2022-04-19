//module_name: count_zero
//date       : 2022.4.17
//author     : Zmz03
//description: count the number of 0 before 1 in one data, for example count 0010_1001 is 2.

module count_zero (
    clk,
    i_data,
    o
);

parameter width = 8;

input clk;
input  [width   - 1  : 0] i_data;

output reg [width/2 - 1  : 0] o;

wire   [width   - 1  : 0] i_data_n;
reg    [width   - 1  : 0] i = 0;
reg    [width   - 1  : 0] data_t;

assign i_data_n = ~i_data;

always @(posedge clk)begin
    if(i == 0)begin
        data_t[i] = i_data_n[i];
        i = i + 1;       
    end
    else if(i <= width - 1)begin
        data_t[i] = data_t[i-1] & i_data_n[i];
        i = i + 1;       
    end
    else
        i = 0;
end

always @(posedge clk) begin
    if(i <= width - 1)begin
        o = o + data_t[i]; 
        i = i + 1;       
    end
    else begin
        o = 0;
        i = 0;
    end
end
    
endmodule