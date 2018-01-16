`include "uvm_macros.svh"	
import uvm_pkg::*;

class general_seq_item extends uvm_sequence_item;

	`uvm_object_utils(general_seq_item)

	randc bit [7:0] elem1, elem2;
	randc bit [2:0] op;

	//Constructor
	function new(string name = "general_seq_item");
		super.new(name);
	endfunction

endclass
