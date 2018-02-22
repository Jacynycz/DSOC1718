import core::*;
class general_sequence extends uvm_sequence#(general_seq_item);  
  `uvm_object_utils(general_sequence)

    //Constructor
  function new(string name = "general_sequence");
    super.new(name);
  endfunction
   
  virtual task body();
  `uvm_info ("BASE_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
  repeat(200)
  begin
    `uvm_do(req);
  end
  `uvm_info (get_type_name (), $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
  
endtask
endclass 