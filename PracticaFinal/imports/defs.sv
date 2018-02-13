
package defs;
	parameter version = "1.0";

	typedef logic[7:0] character;

	typedef  logic[7:0][7:0] packet_input;

	typedef struct packed {
		logic [511:0] data;
	} packet_output;

	function automatic packet_input str_to_byte(string s);
		$display("%s",s);
		for(int i=0;i<8;i++) begin
			str_to_byte[7-i] = s.getc(i);
		end
	endfunction : str_to_byte

endpackage