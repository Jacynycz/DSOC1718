class transaction;
	randc bit [7:0] elem1, elem2;
	randc bit [2:0] op;
	constraint c1	{op >	0;
					 op <	5;}
endclass
