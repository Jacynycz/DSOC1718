import imports::*;	

class and_seq_item extends general_seq_item;
`uvm_object_utils(and_seq_item)
	constraint c1	{op == 2;}

  //Constructor
  function new(string name = "and_seq_item");
    super.new(name);
  endfunction
   
endclass
