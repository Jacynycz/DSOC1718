
class coverage;
	
	virtual bfm bfm_i;

	covergroup CovPort @ (posedge bfm_i.done);	
		coverpoint bfm_i.result;
		coverpoint bfm_i.A;
		coverpoint bfm_i.B;	
	endgroup
	

	function new(virtual bfm _bfm_i);
		bfm_i = _bfm_i;
		CovPort = new();
	endfunction

	task do_cover();
		CovPort.start();
	endtask

endclass