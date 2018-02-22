class general_env extends uvm_env;
   
  //---------------------------------------
  // agent and scoreboard instance
  //---------------------------------------
  general_agent      agent_i;
  general_scoreboard scoreboard_i;
   
  `uvm_component_utils(general_env)
   
  //---------------------------------------
  // constructor 
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  //---------------------------------------
  // build_phase - crate the components
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
 
    agent_i = general_agent::type_id::create("agent_i", this);
    scoreboard_i  = general_scoreboard::type_id::create("scoreboard_i", this);
  endfunction : build_phase
   
  //---------------------------------------
  // connect_phase - connecting monitor and scoreboard port
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    agent_i.monitor.item_collected_port.connect(scoreboard_i.item_collected_export);
  endfunction : connect_phase
 
endclass : general_env