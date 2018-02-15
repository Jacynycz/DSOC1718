`include "uvm_macros.svh";
`include "sequencer/items/srandomizer/randomizer.sv";
import uvm_pkg::*;
import defs::*;

class general_seq_item extends uvm_sequence_item;

	`uvm_object_utils(general_seq_item)

	randomizer in;

	//Constructor
	function new(string name = "general_seq_item");
		super.new(name);
		in = new;
	endfunction

	function print();
		$display("%s",in.get_str());
	endfunction : print

endclass
