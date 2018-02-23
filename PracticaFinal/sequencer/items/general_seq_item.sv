`include "uvm_macros.svh"
`include "sequencer/items/srandomizer/randomizer.sv";
import uvm_pkg::*;
import defs::*;

class general_seq_item extends uvm_sequence_item;

	`uvm_object_utils(general_seq_item)

	string in;
	
	//Constructor
	function new(string name = "general_seq_item");
		super.new(name);
	endfunction : new

endclass
