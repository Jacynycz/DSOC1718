`timescale 10ns / 1ns

interface bfm();

parameter CLOCK_PERIOD = 10;

logic [7:0] A;
logic [7:0] B;
logic [2:0] op;
logic clk;
logic reset_n;
logic start;
logic done;
logic [15:0] result;



task automatic send_command(
					input [7:0] _A,
					input [7:0] _B,
					input [2:0] _op);
	//reset_n <= 1'b1;
	@(posedge clk)
	start <= 1'b0;
	A  <=  _A;
	B  <=  _B;
	op <=  _op;
	@(posedge clk)
	start <= 1'b1;
	@(posedge clk)
	start <= 1'b0;
	@(posedge done);
endtask

task send_reset();
	@(posedge clk)
	reset_n <= 1'd0;
	repeat(2)
	@(posedge clk);
	reset_n <= 1'd1;
endtask

	
initial begin : p_init_values
	clk = 1'b0;
	start = 1'b0;
	A = 8'd0;
	B = 8'd0;
	op = 3'd0;
	reset_n = 1'b0;
end

always
	#(CLOCK_PERIOD/2)  clk =  !clk;

initial begin
	//reset_n = 1'b1;
	start = 1'b0;

	//#(CLOCK_PERIOD/2)	reset_n = 1'b0;
	//#(CLOCK_PERIOD) reset_n = 1'b1;
end

endinterface