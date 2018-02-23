`include "uvm_macros.svh"
import uvm_pkg::*;
import defs::*;

class string_seq_item extends uvm_sequence_item;

	`uvm_object_utils(string_seq_item)

	string in;
	packet_output expected;
	integer fd;

	//Constructor
	function new(string name = "string_seq_item",string val = "");
		super.new(name);
		$fscanf(fd,"%s\n",in);
      	$fscanf(fd,"%h\n",expected);
	endfunction : new

	function void print();
		$display("Seq item with size %d\nValue %s",in.len(),in);
	endfunction : print

endclass
