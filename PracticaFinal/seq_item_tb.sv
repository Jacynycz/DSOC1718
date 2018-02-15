`include "sequencer/items/general_seq_item.sv";
module seq_item_tb;
   
  //instance
  general_seq_item seq_item;
   
  initial begin
    //create method
    seq_item = general_seq_item::type_id::create();
     
    //randomizing the seq_item
    seq_item.randomize();
     
    //printing the seq_item
    seq_item.print();  
        //randomizing the seq_item
    seq_item.randomize();
     
    //printing the seq_item
    seq_item.print();  
  end 
endmodule