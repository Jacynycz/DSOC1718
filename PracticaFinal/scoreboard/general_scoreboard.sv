import core::*;

class general_scoreboard extends uvm_scoreboard;
 
  `uvm_component_utils(general_scoreboard)
  uvm_analysis_imp#(data_item, general_scoreboard) item_collected_export;
  bit verbose = 1;

  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction: build_phase
   
  // write
  virtual function void write(data_item pkt);
    pkt.print();
    pkt.check();
  endfunction : write
 
endclass : general_scoreboard