
package defs;
	parameter version = "1.0";

	typedef logic[32:0] character;

	typedef logic[7:0][7:0] packet_input;

	typedef logic [511:0] packet_output;

	typedef character [16:0] packet_output_aux;

	function automatic packet_input str_to_byte(string s);
		//$display("%s",s);
		for(int i=0;i<8;i++) begin
			str_to_byte[7-i] = s.getc(i);
		end
	endfunction : str_to_byte

	function automatic packet_output str_to_output(string s);
		
		packet_output_aux r;
		packet_output res;
		string next; 
		string rem;
		string str = s;
		//$display("%s",str);
		for(int i=0;i<16;i++) begin
			next = str.substr(str.len()-8,str.len()-1);
			//lo restamos del string
			rem = str.substr(0,str.len()-9);
			r[i] = next.atohex();
			str = rem;
		end
		res = r;
		return res;
	endfunction : str_to_output

	function void print_out(packet_output out);
		$display("Paquete de salida con valor: %h",out);
	endfunction : print_out
 
endpackage