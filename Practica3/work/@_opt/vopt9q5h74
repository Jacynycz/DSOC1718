library verilog;
use verilog.vl_types.all;
entity tinyalu is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        op              : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        start           : in     vl_logic;
        done            : out    vl_logic;
        result          : out    vl_logic_vector(15 downto 0)
    );
end tinyalu;
