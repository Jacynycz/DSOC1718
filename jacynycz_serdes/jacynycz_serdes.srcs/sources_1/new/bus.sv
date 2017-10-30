import definitions::*;
interface bus;

	packet_t data;
	logic req;
	logic ack;

	modport requester(
		output data,
		output req,
		input ack
		);

	modport acknowledger(
		input data,
		output ack,
		input req
		);

endinterface
