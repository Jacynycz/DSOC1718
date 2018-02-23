`include "uvm_macros.svh"
import uvm_pkg::*;
import defs::packet_output;

class data_item extends uvm_component;

	`uvm_component_utils(data_item)

	string in;
	packet_output out;
	packet_output expected_output;

	//Constructor
	function new(string name = "data_item",uvm_component 	parent);
		super.new(name,parent);
	endfunction : new

	function void print();
		`uvm_info("SCOREBOARD_INFO",
			$sformatf("Recibido\n   IN: %s\nOUT: %h",this.in,this.out),
				UVM_HIGH);
	endfunction : print

	function void check();
		if (this.out != this.expected_output)
		`uvm_error("SCOREBOARD_ERROR",
			$sformatf("\nERROR EN EL STRING: %s\nSALIDA ESPERADA: %h\nSALIDA OBTENIDA: %h",
			this.in,
			this.out,
			this.expected_output)); 
	endfunction : check

endclass
