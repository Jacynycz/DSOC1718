
package core;
	parameter version = "1.0";

	// Sequence items
	`include "sequencer/items/general_seq_item.sv"
	
	// Sequences
	`include "sequencer/sequences/general_sequence.sv"

	// Sequencer
	`include "sequencer/general_sequencer.sv"

	// Helper classes
	`include "helpers/data_item.sv"

	// Driver
	`include "driver/general_driver.sv"

	// Monitors
	`include "monitor/general_monitor.sv"

	// Agents
	`include "agent/general_agent.sv"

	// Scoreboards
	`include "scoreboard/general_scoreboard.sv"

	// Envs
	`include "env/general_env.sv"

	// Tests
	`include "tests/test1.sv"

endpackage