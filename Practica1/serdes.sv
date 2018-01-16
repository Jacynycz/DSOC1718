import definitions::*;

module serdes (input  wire din,
               input  wire clk,
               input  wire rst,
               output logic dout);

	logic     data_en;
	bus bus1();
	bus bus2();
    deserializer i_des (.*,.output_bus(bus1.requester));
    scrambler i_scrambler(.*,.output_bus(bus2.requester),
    .input_bus(bus1.acknowledger));
    serializer   i_ser (.*,.input_bus(bus2.acknowledger));

endmodule // serdes