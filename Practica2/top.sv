`include "tester.sv"
`include "coverage.sv"
`include "scoreboard.sv"

module top ();

bfm bfm_i();
tinyalu tinyalu_int(.A(bfm_i.A),
					.B(bfm_i.B),
					.op(bfm_i.op),
					.clk(bfm_i.clk),
					.reset_n(bfm_i.reset_n),
					.start(bfm_i.start),
					.done(bfm_i.done),
					.result(bfm_i.result));

tester tester_i;
coverage coverage_i;
scoreboard scoreboard_i;

initial begin
	 tester_i = new(bfm_i);
	 coverage_i = new(bfm_i);
	 scoreboard_i = new(bfm_i);
	 fork;
		 coverage_i.do_cover();
		 scoreboard_i.analize();
		 tester_i.test();
	join_none
end
endmodule

//vlog tinyalu.sv;vlog bfm.sv;vlog transaction.sv;vlog driver.sv;vlog top.sv;restart -f;run 10us
//radix define operator {3'b001 "Sum" -color orange,3'b010 "And" -color green, 3'b011 "Xor" -color red, 3'b??? "unk" -color blue}