`include "sequencer/items/srandomizer/randomizer.sv";
import defs::*;
module test_reader;

    initial begin
        integer fd; 
        int status;
        string s1,s2;
        packet_output p;
        fd = $fopen("testsmall.txt","r");
        status = $fscanf(fd,"%s\n",s1);
        status = $fscanf(fd,"%h\n",p);
        $display("%s\n%h",s1,p);
    end

endmodule