library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory is
    port(
        ler         : in std_logic;
        endereco    : in INTEGER RANGE 0 TO 15;
        resposta    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of memory is

TYPE matriz IS ARRAY (INTEGER RANGE 0 TO 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

CONSTANT memory_inst : matriz :=
("00000001",
"10010111",
"00100010",
"00001100",
"10011000",
"01001000",
"01000000",
"00011011",
"00000001",
"10010111",
"00100010",
"00001100",
"10011000",
"01001000",
"01000000",
"00011011");


begin

    --resposta <= memory_inst(endereco);

    process(ler)
        begin
            if (ler = '1') then
                resposta <= memory_inst(endereco);
            else
                resposta <= "00000000";
            end if;
        end process;
        
end behavior;
