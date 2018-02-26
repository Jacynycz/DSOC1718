`include "sequencer/items/srandomizer/randomizer.sv";
module manual_test;

    bfm i_bfm();

    keccak dut (
        .clk(i_bfm.clk),
        .reset(i_bfm.reset),
        .in(i_bfm.in),
        .in_ready(i_bfm.in_ready),
        .is_last(i_bfm.is_last),
        .byte_num(i_bfm.byte_num),
        .buffer_full(i_bfm.buffer_full),
        .out(i_bfm.out),
        .out_ready(i_bfm.out_ready)
    );

    randomizer#(5) sshort;
    randomizer#(40) smedium;
    randomizer#(120) slarge;
    randomizer#(2000) shuge;

    initial begin
        sshort = new;
        smedium = new;
        slarge = new;
        shuge = new;
        repeat(2)
        begin
            sshort.randomize();
            smedium.randomize();
            slarge.randomize();
            shuge.randomize();
            i_bfm.send(sshort.get_str());
            i_bfm.send(smedium.get_str());
            i_bfm.send(slarge.get_str());
            i_bfm.send(shuge.get_str());
        end
        i_bfm.send("1");
    end

endmodule