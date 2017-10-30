import definitions::*;

module serializer (
            output logic dout,
            input wire   clk,
            input wire   rst,
            input wire   data_en,
            input packet_t data);
   
   packet_t  data_reg;
   byte      head_in;	
   
   always_ff @ (posedge clk)
     if (rst)
       data_reg <= '{8'd0, 8'd0, 8'd0, 8'd0};
     else if (data_en)
       data_reg <= '{data.field3, data.field2, data.field1, data.field0};
     else
       data_reg <= data_reg >> 1;
   
   assign dout = data_reg.field3[0];
	
endmodule // des
