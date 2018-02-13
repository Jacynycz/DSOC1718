import imports::*;
class general_sequencer extends uvm_sequencer#(general_seq_item); 
   `uvm_sequencer_utils(general_sequencer)
      
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
endclass : general_sequencer