import core::*;
class file_sequence extends uvm_sequence#(string_seq_item);  
  `uvm_object_utils(general_sequence)

  string filename;
  string string_to_hash;
  packet_output result_espected;
  integer fd; //file descriptor

  //Constructor
  function new(string name = "general_sequence",string _filename);
    super.new(name);
    filename = _filename;
  endfunction
   
  virtual task body();
    `uvm_info ("BASE_SEQ", $sformatf ("Starting body of %s", this.get_name()), UVM_MEDIUM)
    while (!$feof(fd))
    begin
      req = string_seq_item::type_id::create("req");  //create the req (seq item)
      wait_for_grant();                            //wait for grant
      assert(req.randomize());                     //randomize the req                   
      send_request(req);                           //send req to driver
      wait_for_item_done();                        //wait for item done from driver
      get_response(rsp);                           //get response from driver
    end
    `uvm_info (get_type_name (), $sformatf ("Sequence %s is over", this.get_name()), UVM_MEDIUM)
  endtask
endclass 