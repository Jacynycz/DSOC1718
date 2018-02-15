`timescale 1ns / 1ps

interface bfm();

import defs::*;

parameter CLOCK_PERIOD = 10;

  // Inputs
    logic clk;
    logic reset;
    logic[63:0] in;
    logic in_ready;
    logic is_last;
    logic [2:0] byte_num;

    // Outputs
    logic buffer_full;
    packet_output out;
    logic out_ready;

    // Var
    integer i;
    packet_input next_byte;
    string next;
    string rem;
    int size;

task automatic send(string str);
	send_reset();
	in_ready = 1;
	$display("Enviando cadena de texto: %s\n Longitud: %d",str,str.len());
	while(str.len() > 8)
	begin
			//si el buffer del chip está lleno esperamos
		while(buffer_full == 1)
			@(posedge clk);
		
			//obtenemos el siguiente byte a enviar
		next = str.substr(0,7);
			//lo restamos del string
		rem = str.substr(8,str.len()-1);
			//lo convermitmos a byte
		next_byte = str_to_byte(next);

		$display("Enviando '%s' convertido a '%h'",next,next_byte);
		send_byte(next_byte,0,0);
		str = rem;
	end

	while(buffer_full == 1)
		@(posedge clk);

	size = str.len();

	while(str.len()<8)
		str={str," "};	

	next_byte = str_to_byte(str);
	send_byte(next_byte,size,1);
	in_ready = 0;
	
	@(posedge out_ready);
	$display("Listo");
endtask


task send_byte(packet_input byte_in,logic[3:0] num, logic last);
	byte_num = num;
	is_last = last;
	in = byte_in;
	@(posedge clk);
endtask : send_byte

task send_reset();
	@(posedge clk)
	reset <= 1'd0;
	@(posedge clk);
	reset <= 1'd1;
	@(posedge clk);
	reset <= 1'd0;
endtask

	
initial begin : p_init_values
	clk = 1'b0;
	reset = 1'b0;
end

always
	#(CLOCK_PERIOD/2)  clk =  !clk;

initial begin
end

endinterface