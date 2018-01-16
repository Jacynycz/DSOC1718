import imports::*;
`include "uvm_macros.svh"	

class add_seq_item extends general_seq_item;
`uvm_object_utils(add_seq_item)
	constraint c1	{op == 1;}

  //Constructor
  function new(string name = "add_seq_item");
    super.new(name);
  endfunction
   
endclass
