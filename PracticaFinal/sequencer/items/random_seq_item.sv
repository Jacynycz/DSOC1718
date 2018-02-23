`include "uvm_macros.svh"
`include "sequencer/items/srandomizer/randomizer.sv";
import uvm_pkg::*;
import defs::*;

class random_seq_item extends general_seq_item;

	`uvm_object_utils(random_seq_item)

	randomizer randomizer_i;
	string in;

	//Constructor
	function new(string name = "random_seq_item");
		super.new(name);
		randomizer_i = new;
	endfunction : new

	function void post_randomize();
		randomizer_i.randomize();
		in = randomizer_i.get_str();
	endfunction : post_randomize

	function void print();
		$display("Seq item with size %d\nValue %s",in.len(),in);
	endfunction : print

endclass
