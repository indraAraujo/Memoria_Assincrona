library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory is
    port(
        reqLeit     : in std_logic;
        endereco    : in std_logic_vector(7 downto 0);
        ack_entrada : in std_logic();
        resposta    : out std_logic_vector(7 downto 0);
        ack_saida   : out
        dadoPrt     : out std_logic;
    );
end entity;

architecture behavior of memory is
signal memory_inst: std_logic_vector()
signal last_ack
begin

    process(reqLeit)
        begin
            if(reqLeit==='1' && ack_entrada===last_ack){
                resposta <= memory_inst[endereco];
            }
        end process;
    ack_saida <= last_ack + 1;
    last_ack <= ack_saida;
    dadoPrt <= '1';
end behavior;