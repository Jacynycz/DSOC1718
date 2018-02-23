vlib work
quit -sim

vlog -f filelist.f
vsim -coverage +UVM_TESTNAME=test_small_strings +UVM_VERBOSITY=UVM_LOW work.top 

add wave -position insertpoint  \
sim:/top/bfm/clk \
sim:/top/bfm/reset

add wave -noupdate -divider Inputs

add wave -position insertpoint  \
sim:/top/bfm/in \
sim:/top/bfm/in_ready \
sim:/top/bfm/byte_num \
sim:/top/bfm/is_last

radix signal sim:/top/bfm/in ascii
radix signal sim:/top/bfm/byte_num unsigned

add wave -noupdate -divider Outputs

add wave -position insertpoint  \
sim:/top/bfm/buffer_full \
sim:/top/bfm/out \
sim:/top/bfm/out_ready

radix signal sim:/top/bfm/out hexadecimal

run 10ms