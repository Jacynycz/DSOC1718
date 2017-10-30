import definitions::*;

module serdes (input  wire din,
               input  wire clk,
               input  wire rst,
               output logic dout);

	logic     data_en;
	packet_t  data_in;
	packet_t  data_out;
   deserializer i_des (.*,.data(data_in));
   scrambler i_scrambler(.*);
   serializer   i_ser (.*,.data(data_out));

endmodule // serdes