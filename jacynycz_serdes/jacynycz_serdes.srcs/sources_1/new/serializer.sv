import definitions::*;

module serializer (
            output logic dout,
            input wire   clk,
            input wire   rst,
            input wire   data_en,
            bus.acknowledger data);

   packet_t  data_reg;
   byte      head_in;

   enum {idle,request,receiving} state, next_state;

   always_ff @ (posedge clk)
     if (rst)
       data_reg <= '{8'd0, 8'd0, 8'd0, 8'd0};
     else if (data_en && state == receiving)
       data_reg <= '{input_bus.data.field3,
                     input_bus.data.field2,
                     input_bus.data.field1,
                     input_bus.data.field0};
     else
       data_reg <= data_reg >> 1;

   always_comb begin
  		input_bus.ack = 0;
  		case (state)
  		  idle: if (input_bus.req == 1) begin
  		    next_state = request;
  		  end;
        request: begin
        input_bus.ack = 1;
        next_state = receiving;
        end
  		  default: next_state = idle;
  		endcase
    end

    always_ff @ (posedge clk) begin
   		if (rst) begin
   			state <= idle;
   		end else begin
   			state  <= next_state;
   		end
   	end


   assign dout = data_reg.field3[0];

endmodule // des
