
class scoreboard;
	
	virtual bfm bfm_i;

	function new(virtual bfm _bfm_i);
		bfm_i = _bfm_i;
	endfunction

	task analize();
		logic A;
		logic B;
		logic op;
		forever begin
			@(posedge bfm_i.start);
			A = bfm_i.A;
			B = bfm_i.B;
			op = bfm_i.op;
			@(posedge bfm_i.done);
			case (op)
				3'b001: if(A + B != bfm_i.result) begin
					$display("Error en SUM");
				end
				3'b010:if(A & B != bfm_i.result) begin
					$display("Error en AND");
				end
				3'b011:if(A ^ B != bfm_i.result) begin
					$display("Error en XOR");
				end
				3'b100:if(A * B != bfm_i.result) begin
					$display("Error en MUL");
				end
				default : $display("Operación desconocida");
			endcase
		end
	endtask

endclass