import definitions::packet_t;

module deserializer (
							input wire 	 din,
							input wire 	 clk,
							input wire 	 rst,
							bus.requester output_bus,
							output logic data_en);
   /*---------------------------------------------------------------------------
	 * Definition of signals
	*----------------------------------------------------------------------------*/
	integer  cntr;
	packet_t data;

	enum {idle,request,sending} state, next_state;

   always_ff @ (posedge clk)
	 if (rst)
	   cntr <= 0;
	 else if (cntr == 32)
	   cntr <= 0;
	 else
	   cntr <= cntr + 1;

	always_ff @ (posedge clk) begin
		if (rst) begin
			state <= idle;
		end else begin
			state  <= next_state;
		end
	end

   always_ff @ (posedge clk)
	 if (rst)
	   data <= '{8'd0, 8'd0, 8'd0, 8'd0};
	 else begin
	   data <= {din, data[31:1]};
	 end

	 always_comb begin
    next_state = state;
		output_bus.req = 0;
		output_bus.data = 32'd0;
		case (state)
			sending: begin
			 output_bus.data = data;
			 next_state = idle;
			 end
			request: if (output_bus.ack == 1) begin
				next_state = sending;
			end else begin
				next_state = state;
			end
			idle: if (cntr == 32) begin
				next_state = request;
				output_bus.req = 1;
			end else begin
				output_bus.req = 0;
			end
			default: output_bus.req = 0;
		endcase
	 end


endmodule // des
