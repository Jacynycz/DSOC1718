import imports::*;

class xor_seq_item extends general_seq_item;
`uvm_object_utils(xor_seq_item)
	constraint c1	{op == 3;}

  //Constructor
  function new(string name = "xor_seq_item");
    super.new(name);
  endfunction
   
endclass
