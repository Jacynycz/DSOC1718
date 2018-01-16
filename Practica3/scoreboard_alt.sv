class scoreboard_alt; 

mailbox test2sb; 
mailbox res2sb; 

function new(mailbox test2sb,mailbox res2sb); 
this.test2sb = test2sb; 
this.res2sb = res2sb; 
endfunction:new 


task start(); 
packet pkt_rcv,pkt_exp; 
forever 
begin 
res2sb.get(pkt_rcv); 
$display(" %0d : Scorebooard : Scoreboard received a packet from receiver ",$time); 
test2sb.get(pkt_exp); 
if(pkt_rcv.compare(pkt_exp)) 
$display(" %0d : Scoreboardd :Packet Matched ",$time); 
else 
$root.error++; 
end 
endtask : start 

endclass 