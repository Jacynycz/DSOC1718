
import core::*;

class general_driver extends uvm_driver #(general_seq_item);
 
  // Virtual Interface
  virtual bfm bfm;
 
  `uvm_component_utils(general_driver)
     
  //uvm_analysis_port #(general_seq_item) Drvr2Sb_port;
 
  // Constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual bfm)::get(this, "", "bfm", bfm))
       `uvm_fatal("NO_bfm_i",{"virtual interface must be set for: ",get_full_name(),".bfm_i"});
  endfunction: build_phase
 
  // run phase
  virtual task run_phase(uvm_phase phase);
    forever begin
    seq_item_port.get_next_item(req);
    //respond_to_transfer(req);
    drive();
    seq_item_port.item_done();
    end
  endtask : run_phase
 
  // drive
  virtual task drive();
    bfm.send(req.in.get_str());
  endtask : drive
 
endclass : general_driver