`include "uvm_macros.svh"	
import uvm_pkg::*;
import core::*;

module top ();

bfm bfm();
keccak dut (
        .clk(bfm.clk),
        .reset(bfm.reset),
        .in(bfm.in),
        .in_ready(bfm.in_ready),
        .is_last(bfm.is_last),
        .byte_num(bfm.byte_num),
        .buffer_full(bfm.buffer_full),
        .out(bfm.out),
        .out_ready(bfm.out_ready)
    );

// driver.seq_item_port.connect(sequencer.seq_item_export);

initial begin
	uvm_config_db#(virtual bfm)::set(uvm_root::get(),"*","bfm",bfm);	
	run_test();
end

endmodule

//vlog tinyalu.sv;vlog bfm.sv;vlog transaction.sv;vlog driver.sv;vlog top.sv;restart -f;run 10us
//radix define operator {3'b001 "Sum" -color orange,3'b010 "And" -color green, 3'b011 "Xor" -color red, 3'b??? "unk" -color blue}