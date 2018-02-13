`include "uvm_macros.svh"	
import uvm_pkg::*;

module top ();

bfm i_bfm();
keccak dut (
        .clk(i_bfm.clk),
        .reset(i_bfm.reset),
        .in(i_bfm.in),
        .in_ready(i_bfm.in_ready),
        .is_last(i_bfm.is_last),
        .byte_num(i_bfm.byte_num),
        .buffer_full(i_bfm.buffer_full),
        .out(i_bfm.out),
        .out_ready(i_bfm.out_ready)
    );


// driver.seq_item_port.connect(sequencer.seq_item_export);

initial begin
	uvm_config_db #(virtual bfm)::set(null,"*","bfm",i_bfm);	
	run_test();
end

endmodule

//vlog tinyalu.sv;vlog bfm.sv;vlog transaction.sv;vlog driver.sv;vlog top.sv;restart -f;run 10us
//radix define operator {3'b001 "Sum" -color orange,3'b010 "And" -color green, 3'b011 "Xor" -color red, 3'b??? "unk" -color blue}