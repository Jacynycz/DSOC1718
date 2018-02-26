import core::*;
class medium_strings_sequence extends uvm_sequence#(general_seq_item);  
  `uvm_object_utils(medium_strings_sequence)

  string filename;
  string string_to_hash;
  packet_output result_espected;
  integer fd; //file descriptor
  integer read_state;
  string aux_in;
  packet_output aux_expected;
    
  //Constructor
  function new(string name = "medium_strings_sequence");
    super.new(name);
  endfunction
   
  virtual task body();
    `uvm_info ("SEQUENCE", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
    fd = $fopen("./tests/dataset_medium.txt","r");
    
    while (!$feof(fd))
    begin
      req = general_seq_item::type_id::create("req");  //create the req (seq item)
      
      read_state = $fgets(aux_in,fd);
      aux_in =  aux_in.substr(0,aux_in.len()-2);
      read_state = $fscanf(fd,"\n%h\n",aux_expected);
      wait_for_grant();                            //wait for grant
      req.in = aux_in;
      req.expected = aux_expected;                  
      send_request(req);                           //send req to driver
      wait_for_item_done();                        //wait for item done from driver
    end
    `uvm_info ("SEQUENCE", $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
  endtask
endclass 