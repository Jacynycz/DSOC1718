`include "uvm_macros.svh"
import uvm_pkg::*;
import core::*;

class test_random_strings extends uvm_test; 
 
  `uvm_component_utils(test_random_strings)
 
  general_env env;
  random_strings_sequence seq;

  function new(string name = "test_random_strings",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = general_env::type_id::create("env", this);
    seq = random_strings_sequence::type_id::create("seq",this);
  endfunction : build_phase
 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent_i.sequencer);
    phase.drop_objection(this);
  endtask : run_phase
 
endclass : test_random_strings
