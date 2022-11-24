library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory_fsm is
    port(
        reqLeit     : in std_logic;
        ack_entrada : in std_logic();
        ack_saida   : out
        dadoPrt     : out std_logic;
    );
end entity;

architecture behavior of memory_fsm is
signal ler: std_logic;
begin

    process(reqLeit, ack_entrada)
        begin
            if(reqLeit==='1' && ack_entrada==='0'){
                ack_saida <= '1';
                ler='0';
            }elsif(reqLeit==='0' && ack_entrada==='0'){
                ack_saida <= '0';
                ler='1';
                dadoPrt <= '1';
            }elsif(reqLeit==='0' && ack_entrada==='1'){
                dadoPrt <= '0';
                ler='0';
            }
        end process;
end behavior;