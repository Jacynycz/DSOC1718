import imports::*;

class driver;

	virtual bfm bfm_i;

	function new(virtual bfm _bfm_i);
		bfm_i = _bfm_i;
	endfunction

	task init();
		bfm_i.send_reset();
	endtask

	task inject(transaction _transaction);
		bfm_i.send_command(_transaction.elem1,
			_transaction.elem2,_transaction.op);
		@(posedge bfm_i.clk);
		@(posedge bfm_i.clk);
	endtask 

endclass
