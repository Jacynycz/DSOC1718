import imports::*;
class tester;
	
	driver driver_h;
	transaction tr;

	function new(virtual bfm _bfm_i);
		driver_h = new(_bfm_i);
	endfunction

	task test();
		tr = new();
		driver_h.init();
		forever begin
			randomize(tr);
			driver_h.inject(tr);
		end
	endtask

endclass : tester