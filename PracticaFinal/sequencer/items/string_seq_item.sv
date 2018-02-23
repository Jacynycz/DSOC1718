`include "uvm_macros.svh"
import uvm_pkg::*;
import defs::*;

class string_seq_item extends general_seq_item;

	`uvm_object_utils(string_seq_item)

	string in;
	packet_output expected;
	integer fd;
	integer read_state;

	//Constructor
	function new(string name = "string_seq_item",string val = "");
		super.new(name);
		read_state = $fscanf(fd,"%s\n",in);
		$display("leido %s\n",in);
      	read_state = $fscanf(fd,"%h\n",expected);
	endfunction : new

	function void print();
		$display("Seq item with size %d\nValue %s",in.len(),in);
	endfunction : print

endclass
