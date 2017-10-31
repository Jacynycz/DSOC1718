library verilog;
use verilog.vl_types.all;
entity tb_serdes is
    generic(
        CLOCK_PERIOD    : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
end tb_serdes;
