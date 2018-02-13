import imports::*;

class mul_seq_item extends general_seq_item;
`uvm_object_utils(mul_seq_item)
	constraint c1	{op > 3;}

  //Constructor
  function new(string name = "mul_seq_item");
    super.new(name);
  endfunction
   
endclass
