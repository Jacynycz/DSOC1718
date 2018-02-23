`include "uvm_macros.svh"
import uvm_pkg::*;
import defs::packet_output;

class file_handler;

	integer file_descriptor;
	integer read_state;
	string filename;
	//Constructor
	function new(string _filename);
		filename = _filename;
		file_descriptor = $fopen(filename,"r");
	endfunction : new

	function void print_info();
		$display("File %s with descriptor %s",filename,file_descriptor);
	endfunction :  print_info
	function string get_string();
		string s;
		read_state = $fscanf(file_descriptor,"%s\n",s);
		return s;
	endfunction : get_string

	function packet_output get_expected();
		packet_output o;
      	read_state = $fscanf(file_descriptor,"%h\n",o);
      	return o;
	endfunction : get_expected

	function bit is_eof();
		return $feof(file_descriptor);
	endfunction : is_eof

endclass
