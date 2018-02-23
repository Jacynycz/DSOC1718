`include "sequencer/items/srandomizer/randomizer.sv";
import defs::*;
module test_reader;

    initial begin
        integer fd; 
        int status;
        string s1,s2;
        packet_output p;
        fd = $fopen("testsmall.txt","r");
        status = $fscanf(fd,"%s;%s",s1,s2);
        $display("%s,%h",s1,s2);
    end

endmodule