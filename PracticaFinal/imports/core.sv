
package core;
	parameter version = "1.0";

		// Helper classes
	`include "helpers/data_item.sv"

	// Sequence items
	`include "sequencer/items/general_seq_item.sv"
	
	// Sequences
	`include "sequencer/sequences/general_sequence.sv"
	`include "sequencer/sequences/small_strings_sequence.sv"

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

	// Envs
	`include "env/general_env.sv"

	// Tests
	`include "tests/test_small_strings.sv"

endpackage