library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory is
    port(
        ler     : in std_logic;
        endereco    : in std_logic_vector(7 downto 0);
        resposta    : out std_logic_vector(7 downto 0);
    );
end entity;

architecture behavior of memory is
signal memory_inst: std_logic_vector() %%fazer vetor de vetores
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