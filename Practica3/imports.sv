
package imports;
	parameter version = "1.0";

	// Sequence items
	`include "sequencer/items/general_seq_item.sv"
	`include "sequencer/items/add_seq_item.sv"
	`include "sequencer/items/xor_seq_item.sv"
	`include "sequencer/items/mul_seq_item.sv"
	`include "sequencer/items/and_seq_item.sv"
	
	// Sequences
	`include "sequencer/sequences/general_sequence.sv"
	`include "sequencer/sequences/add_sequence.sv"
	`include "sequencer/sequences/xor_sequence.sv"
	`include "sequencer/sequences/mul_sequence.sv"
	`include "sequencer/sequences/and_sequence.sv"

	// Sequencer
	`include "sequencer/general_sequencer.sv"

	// Driver
	`include "driver/general_driver.sv"

	// Monitors
	`include "monitor/general_monitor.sv"

	// Agents
	`include "agent/general_agent.sv"

	// Scoreboards
	`include "scoreboard/general_scoreboard.sv"

	// Enviorment
	`include "env/general_env.sv"

	// Tests
	`include "tests/test1.sv"
	`include "tests/test2.sv"
	`include "tests/test3.sv"
	`include "tests/test4.sv"

endpackage