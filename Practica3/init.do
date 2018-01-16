vlog tinyalu.sv;
vlog bfm.sv;
vlog transaction.sv;
vlog imports.sv;
vlog driver.sv;
vlog coverage.sv;
vlog scoreboard.sv;
vlog top.sv;
vlog tester.sv;
vsim -coverage work.top;
add wave -position insertpoint  \
sim:/top/bfm_i/clk \
sim:/top/bfm_i/reset_n \
sim:/top/bfm_i/start \
sim:/top/bfm_i/done \
sim:/top/bfm_i/A \
sim:/top/bfm_i/B \
sim:/top/bfm_i/op \
sim:/top/bfm_i/result;
radix define operator {3'b001 "Sum" -color orange,3'b010 "And" -color green, 3'b011 "Xor" -color red, 3'b1?? "Mul" -color blue};
run 15 us;