`include "uvm_macros.svh"
import uvm_pkg::*;
import core::*;

class testsmall extends uvm_test; 
 
  `uvm_component_utils(testsmall)
 
  general_env env;
  file_sequence seq;
  integer fd;

  function new(string name = "testsmall",uvm_component parent=null);
    super.new(name,parent);
    fd = $fopen(filename,"r");
    uvm_config_db #(bit)::set(uvm_root::get(), "*", "fd", fd);
  endfunction : new
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = general_env::type_id::create("env", this);
    seq = file_sequence::type_id::create("seq","testsmall",this);
  endfunction : build_phase
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent_i.sequencer);
    phase.drop_objection(this);
  endtask : run_phase
 
endclass : testsmall
