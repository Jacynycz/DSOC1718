import core::*;
class general_scoreboard extends uvm_scoreboard;
 
  `uvm_component_utils(general_scoreboard)
  uvm_analysis_imp#(general_seq_item, general_scoreboard) item_collected_export;
 
  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction: build_phase
   
  // write
  virtual function void write(general_seq_item pkt);
    $display("SCB:: Pkt recived");
    pkt.print();
  endfunction : write
 
endclass : general_scoreboard