import definitions::*;
module scrambler (
	input wire clk,
	input wire rst,
	bus.acknowledger input_bus,
	bus.requester output_bus
);


enum {idle,request,receiving} state_in, next_state_in;

enum {idle_out,request_out,sending_out} state_out, next_state_out;

packet_t data_out;


/*
always_ff @(posedge clk)
begin
	 if (rst)
	   scram <= '{8'd0, 8'd0, 8'd0, 8'd0};
	 else beginput_bus
	 	scram.field0 <= input_bus.data.field3;	//crc
	 	scram.field1 <= input_bus.data.field2;	//payload
	 	scram.field2 <= input_bus.data.field1; //dest
	 	scram.field3 <= input_bus.data.field0; //header
	 end
end
*/

always_ff @(posedge clk)
begin
	 if (rst)
	   data_out <= '{8'd0, 8'd0, 8'd0, 8'd0};
	 else if (state_in == receiving) begin

	 	if(input_bus.data.field3[7] == 1'b1) begin
	 		data_out.field0 <= input_bus.data.field3 ^ 1;
	 	end else begin
	 		data_out.field0 <= input_bus.data.field3 ^ input_bus.data.field3[0];
	 	end

		if(input_bus.data.field2[7] == 1'b1) begin
	 		data_out.field1 <= input_bus.data.field2 ^ 1;
	 	end else begin
	 		data_out.field1 <= input_bus.data.field2 ^ input_bus.data.field2[0];
	 	end
	 	data_out.field2 <= input_bus.data.field1;

	 	if(input_bus.data.field0[7] == 1'b1) begin
	 		data_out.field3 <= input_bus.data.field0 ^ 1;
	 	end else begin
	 		data_out.field3 <= input_bus.data.field0 ^ input_bus.data.field0[0];
	 	end
	 end
end


always_comb begin // comb del output
 next_state_out = state_out;
 output_bus.req = 0;
 output_bus.data = 32'd0;
 case (state_out)
	 sending_out: begin
		output_bus.data = data_out;
		next_state_out = idle_out;
		end
	 request_out: if (output_bus.ack == 1) begin
		 next_state_out = sending_out;
	 end else begin
		 next_state_out = state_out;
	 end
	 idle_out: if (state_in == receiving) begin
		 next_state_out = request_out;
		 output_bus.req = 1;
	 end else begin
		 output_bus.req = 0;
	 end
	 default: output_bus.req = 0;
 endcase
end


always_comb begin //comb del input
	 input_bus.ack = 0;
	 case (state_in)
		 idle: if (input_bus.req == 1) begin
			 next_state_in = request;
		 end
		 request: begin
		 input_bus.ack = 1;
		 next_state_in = receiving;
		 end
		 default: next_state_in = idle;
	 endcase
 end

 always_ff @ (posedge clk) begin
	 if (rst) begin
		 state_in <= idle;
		 state_out <= idle_out;
	 end else begin
		 state_in  <= next_state_in;
		 state_out  <= next_state_out;
	 end
 end


endmodule
