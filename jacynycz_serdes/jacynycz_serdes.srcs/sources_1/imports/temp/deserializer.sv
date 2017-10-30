import definitions::packet_t;

module deserializer (
							input wire 	 din,
							input wire 	 clk,
							input wire 	 rst,
							output packet_t data,
							output logic data_en);
   /*---------------------------------------------------------------------------
	 * Definition of signals
	*----------------------------------------------------------------------------*/
	integer  cntr;
	
   always_ff @ (posedge clk)
	 if (rst)
	   cntr <= 0;
	 else if (cntr == 32)
	   cntr <= 0;
	 else
	   cntr <= cntr + 1;
       

   always_ff @ (posedge clk)
	 if (rst)
	   data <= '{8'd0, 8'd0, 8'd0, 8'd0};
	 else begin
	   // data = data >> 1;
	   // data[31] = din;
	   data <= {din, data[31:1]};

	 end

	assign data_en = (cntr == 32) ? 1'b1 : 1'b0;

endmodule // des
