/*
 * Copyright 2013, Homer Hsing <homer.hsing@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`include "sequencer/items/srandomizer/randomizer.sv";
module test;

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

    randomizer#(3) sshort;
    randomizer#(40) slarge;

    initial begin
        sshort = new;
        sshort.randomize();
        slarge = new;
        slarge.randomize();
        i_bfm.send("Viktor mola mucho porque lanza cosas al dut");
        i_bfm.send("Viktor mola mucho porque lanza cosas al dut y luego intenta desbordar el buffer de entrada para ver cuanto aguanta el sistema");
        i_bfm.send("Vik");
        i_bfm.send(sshort.get_str());
        i_bfm.send(slarge.get_str());
    end

endmodule