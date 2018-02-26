import core::*;
import defs::packet_output;

class general_coverage extends uvm_subscriber#(data_item);

	`uvm_component_utils(general_coverage)
	uvm_analysis_imp#(data_item, general_coverage) item_collected_export;

	packet_output_aux data_item_output;
 
   covergroup data_item_covergroup;
      coverpoint data_item_output[0];
      coverpoint data_item_output[1];
      coverpoint data_item_output[2];
      coverpoint data_item_output[3];
      coverpoint data_item_output[4];
      coverpoint data_item_output[5];
      coverpoint data_item_output[6];
      coverpoint data_item_output[7];
      coverpoint data_item_output[8];
      coverpoint data_item_output[9];
      coverpoint data_item_output[10];
      coverpoint data_item_output[11];
      coverpoint data_item_output[12];
      coverpoint data_item_output[13];
      coverpoint data_item_output[14];
      coverpoint data_item_output[15];
   endgroup: data_item_covergroup
 
   function new(string name="general_coverage", uvm_component parent=null);
      super.new(name, parent);
      item_collected_export = new("item_collected_export", this);
      data_item_covergroup = new;
   endfunction: new
 
   function void write(data_item t);
      data_item_output = t.out;
      `uvm_info("COVERAGE_INFO",
			$sformatf("\nRecibida salida:%h\nFragmentada en: %h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h,%h\n",
				t.out,
				data_item_output[0],
				data_item_output[1],
				data_item_output[2],
				data_item_output[3],
				data_item_output[4],
				data_item_output[5],
				data_item_output[6],
				data_item_output[7],
				data_item_output[8],
				data_item_output[9],
				data_item_output[10],
				data_item_output[11],
				data_item_output[12],
				data_item_output[13],
				data_item_output[14],
				data_item_output[15],),
				UVM_HIGH);
      data_item_covergroup.sample();
   endfunction: write

endclass : general_coverage