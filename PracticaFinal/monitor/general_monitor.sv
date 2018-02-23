import core::*;
class general_monitor extends uvm_monitor;
 
  // Virtual Interface
  virtual bfm bfm;
  bit verbose = 1;
 
  uvm_analysis_port #(data_item) item_collected_port;

 
  // Placeholder to capture transaction information.
  data_item collected;
 
  `uvm_component_utils(general_monitor)
 
  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
    collected = new("data_item",this);
    item_collected_port = new("item_collected_port", this);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual bfm)::get(this, "", "bfm", bfm))
       `uvm_fatal("NO_bfm",{"virtual interface must be set for: ",get_full_name(),".bfm"});
  endfunction: build_phase
 
  // run phase 
  virtual task run_phase(uvm_phase phase);
    forever begin
       @(posedge bfm.out_ready);
       collected.out =  bfm.out;
       collected.in  =  bfm.in_string;
       collected.expected_output = bfm.expected_output;
       item_collected_port.write(collected);
    end
  endtask : run_phase
  
endclass : general_monitor