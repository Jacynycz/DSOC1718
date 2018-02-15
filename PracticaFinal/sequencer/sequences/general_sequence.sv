import core::*;
class general_sequence extends uvm_sequence#(general_seq_item);  
  `uvm_object_utils(general_sequence)

    //Constructor
  function new(string name = "general_sequence");
    super.new(name);
  endfunction
   
  virtual task body();
 
    req = general_seq_item::type_id::create("req");  //create the req (seq item)
    wait_for_grant();                            //wait for grant
    assert(req.randomize());   
    //finish_item();                  //randomize the req                   
    send_request(req);                           //send req to driver
    wait_for_item_done();                        //wait for item done from driver
    get_response(rsp);                           //get response from driver
 
  endtask
endclass