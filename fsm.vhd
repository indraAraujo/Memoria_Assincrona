library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity memory_fsm is
	port(
            reqLeit	    : in std_logic;
            ack_entrada : in std_logic;
            dadoPrt     : out std_logic;
            ler         : out std_logic;
            ack_saida   : out std_logic
		);
end entity;

architecture behavior of memory_fsm is
type state_name is (zero, first, second, third); -- nome dos estados
signal state, next_state : state_name;  -- tipo de dado dos estados
begin

-- processo sequencial TERMINAR
process(reqLeit, ack_entrada)
begin
	state <= next_state;
end process;

-- processo combinacional da saida da FSM
process (state)
begin
	case state is
		when zero =>
			ler <= '0;
            ack_saida <= '0';
            dadoPrt <= '0';
		when first =>
            ler <= '0;
            ack_saida <= '1';
            dadoPrt <= '0';
		when second =>
            ler <= '0;
            ack_saida <= '1';
            dadoPrt <= '1';
		when third =>
            ler <= '0;
            ack_saida <= '0';
            dadoPrt <= '0';
		end case;
end process;

-- processo combinacional da saida da FSM
process (state)
begin
	case state is
		when zero =>
			next_state <= first;
		when first =>
		    next_state <= second;
		when second =>
		    next_state <= third;
		when third =>
            next_state <= zero;
		end case;
end process;

end behavior;
	