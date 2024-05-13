`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2019 09:21:17
// Design Name: 
// Module Name: mean_var_calc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Calculates the mean and average of the data signal over 8e-9*2^(N) seconds
//  Simply determinig <data^2> and <data>^2 to get the variance gives large rounding errors.
//  Calculating Var(data) = sum(data^2)/NbPoints-(sum(data))^2/NbPoint^2 is exact but the multiplication (sum(data))^2 is unnecessarily large, 2*[R+N] bits
//  Here, after calculating sum(data) we keep the minimal number of bits to get (sum(data))^2/2^(2*N) without adding errors
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mean_var_calc #(parameter R=14, N=24)(
    input clk, rst,
    input signed [R-1:0] data_i,//input data
    output signed [R-1:0] mean_o,//mean of data
    output signed [2*R-1:0] var_o//variance of data
    );

    reg signed  [R-1        :0] data_in;//buffer for data signal (for input pipelining)
    reg signed  [R-1        :0] data1;//=data_in, buffer to keep exactly the same data points in the sums of data and data^2
    reg signed  [N+R-1      :0] data1_sum;// =sum(data1)
    reg signed  [2*R+2-1    :0] data1_M;//=data1_sum/2^(N-R-2), keeping minimal resolution without adding errors to variance calculation
    reg signed  [4*R+4-1    :0] data1_M2;//=(data1_M)^2
    reg signed  [R-1        :0] data1_mean;//=data1_sum/2^N, goes to mean output
    reg signed  [2*R-1      :0] data2;//=data_in^2
    reg signed  [N+2*R-1  :0] data2_sum;//=sum(data2)
    reg signed  [2*R-1      :0] data2_mean;//=data2_sum/2^N
    reg signed  [2*R-1      :0] data_var;//=data2_mean-data1_m2/2^(2*R+4), goes to variance output
    reg         [N-1      :0] cnt;//loops over NbPoints=2^(2*N)
    always @ (posedge clk) begin
        if (rst) begin
            cnt         <= {N{1'b0}};
        end
        else begin
            cnt <= cnt + 1'b1;
            data_in <= data_i;
            data1 <= data_in;
            data2 <= data_in * data_in;
            if (&cnt) begin
                data1_sum <= data1;
                data2_sum <= data2;
                data1_mean <= data1_sum[N+R-1:N];
                data2_mean <= data2_sum[N+2*R-1:N];//sum(data^2)/NbPoints
                data1_M <= data1_sum[N+R-1:N-R-2];
            end
            else begin
                data1_sum <= data1 + data1_sum;
                data2_sum <= data2 + data2_sum;
            end
            data1_M2 <= data1_M * data1_M;
            data_var <=  data2_mean - $signed(data1_M2[4*R+4-1:2*R+4]);
        end
    end

assign mean_o = data1_mean;
assign var_o = data_var;

endmodule
/*
module mean_var_calc #(parameter R=14, N=24)(
    input clk, rst,
    input signed [R-1:0] data_i,//input data
    output signed [R-1:0] mean_o,//mean of data
    output signed [2*R-1:0] var_o//variance of data
    );

    reg signed  [R-1        :0] data_in;//buffer for data signal (for input pipelining)
    reg signed  [R-1        :0] data1;//=data_in, buffer to keep exactly the same data points in the sums of data and data^2
    reg signed  [N+R-1      :0] data1_sum;// =sum(data1)
    reg signed  [2*R+2-1    :0] data1_M;//=data1_sum/2^(N-R-2), keeping minimal resolution without adding errors to variance calculation
    wire signed [4*R+3-1    :0] data1_M2;//=(data1_M)^2
    reg signed  [R-1        :0] data1_mean;//=data1_sum/2^N, goes to mean output
    reg signed  [2*R-1      :0] data2;//=data_in^2
    reg signed  [N+2*R-1  :0] data2_sum;//=sum(data2)
    reg signed  [2*R-1      :0] data2_mean;//=data2_sum/2^N
    reg signed  [2*R-1      :0] data_var;//=data2_mean-data1_m2/2^(2*R+4), goes to variance output
    reg         [N-1      :0] cnt;//loops over NbPoints=2^(2*N)
    always @ (posedge clk) begin
        if (rst) begin
            cnt         <= {N{1'b0}};
        end
        else begin
            cnt <= cnt + 1'b1;
            data_in <= data_i;
            data1 <= data_in;
            data2 <= data_in * data_in;
            if (&cnt) begin
                data1_sum <= data1;
                data2_sum <= data2;
                data1_mean <= data1_sum[N+R-1:N];
                data2_mean <= data2_sum[N+2*R-1:N];//sum(data^2)/NbPoints
                data1_M <= data1_sum[N+R-1:N-R-2];
            end
            else begin
                data1_sum <= data1 + data1_sum;
                data2_sum <= data2 + data2_sum;
            end
            data_var <= data2_mean - $signed(data1_M2[4*R+3-1:2*R+4]);
        end
    end

pipe_mult_signed #(.Ra(2*R+2),.Rb(2*R+2),.level(2)) i_sqr_mean (.clk(clk), .a(data1_M) , .b(data1_M), .pdt(data1_M2));//error_abs <=2^13-1 => 26 bits ok


assign mean_o = data1_mean;
assign var_o = data_var;

endmodule
*/

