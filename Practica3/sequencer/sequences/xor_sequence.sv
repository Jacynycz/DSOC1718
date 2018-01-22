import imports::*;
class xor_sequence extends uvm_sequence#(xor_seq_item);  
  `uvm_object_utils(xor_sequence)

    //Constructor
  function new(string name = "xor_sequence");
    super.new(name);
  endfunction
   
  virtual task body();
 
    req = xor_seq_item::type_id::create("req");  //create the req (seq item)
    start_item();                            //wait for grant
    assert(req.randomize());   
    finish_item();                  //randomize the req                   
    //send_request(req);                           //send req to driver
    //wait_for_item_done();                        //wait for item done from driver
    //get_response(rsp);                           //get response from driver
 
  endtask
endclass