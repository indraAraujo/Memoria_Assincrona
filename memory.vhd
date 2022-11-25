library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory is
    port(
        ler         : in std_logic;
        endereco    : in std_logic_vector(4 downto 0);
        resposta    : out std_logic_vector(7 downto 0);
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

    process(ler)
        begin
            if(ler=='1'){
                resposta <= memory_int[endereco];
            }else{
                resposta <= '0';
            }
        end process;
        
end behavior;
