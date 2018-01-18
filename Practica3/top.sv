`include "uvm_macros.svh"	
import uvm_pkg::*;

module top ();

bfm i_bfm();
tinyalu tinyalu_int(.A(i_bfm.A),
					.B(i_bfm.B),
					.op(i_bfm.op),
					.clk(i_bfm.clk),
					.reset_n(i_bfm.reset_n),
					.start(i_bfm.start),
					.done(i_bfm.done),
					.result(i_bfm.result));


// driver.seq_item_port.connect(sequencer.seq_item_export);

initial begin
	uvm_config_db #(virtual bfm)::set(null,"*","bfm",i_bfm);	
	run_test();
end

endmodule

//vlog tinyalu.sv;vlog bfm.sv;vlog transaction.sv;vlog driver.sv;vlog top.sv;restart -f;run 10us
//radix define operator {3'b001 "Sum" -color orange,3'b010 "And" -color green, 3'b011 "Xor" -color red, 3'b??? "unk" -color blue}