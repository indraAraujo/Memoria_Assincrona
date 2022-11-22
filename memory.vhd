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
signal out
begin

    process(reqLeit, ack_entrada)
        begin
            if(reqLeit==='1' && ack_entrada==='0'){
                out <= memory_inst[endereco];
                ack_saida <= '1';
            }elsif(reqLeit==='0' && ack_entrada==='0'){
                ack_saida <= '0';
                resposta <= out;
                dadoPrt <= '1';
            }elsif(reqLeit==='0' && ack_entrada==='1'){
                dadoPrt <= '0';
                %%FALTA: liberar linhas de dados -> como? 
            }
        end process;
end behavior;