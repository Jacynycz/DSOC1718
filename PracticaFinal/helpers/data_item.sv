`include "uvm_macros.svh"
import uvm_pkg::*;
import defs::packet_output;

class data_item extends uvm_component;

	`uvm_component_utils(data_item)

	string in;
	packet_output out;

	//Constructor
	function new(string name = "data_item",uvm_component 	parent);
		super.new(name,parent);
	endfunction : new

	function void print();
		$display("   IN: %s\nOUT: %h",this.in,this.out);
	endfunction : print

endclass
