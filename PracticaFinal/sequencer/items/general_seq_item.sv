`include "uvm_macros.svh"	
import uvm_pkg::*;
import defs::*;

class general_seq_item extends uvm_sequence_item;

	`uvm_object_utils(general_seq_item)

	randc packet_input in;

	//Constructor
	function new(string name = "general_seq_item");
		super.new(name);
	endfunction

endclass
