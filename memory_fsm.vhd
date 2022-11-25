library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory_fsm is
    port(
        reqLeit     : in std_logic;
        ack_entrada : in std_logic;
        ack_saida   : out std_logic;
        dadoPrt     : out std_logic;
        ler         : out std_logic;
    );
end entity;

architecture behavior of memory_fsm is

signal prox_estado  : std_logic_vector(3 downto 0);
signal estado_atual : std_logic_vector(3 downto 0);

begin

    process(reqLeit, ack_entrada)
        begin

            if(estado_atual = "0000" && reqLeit='0')then
            
                elsif(estado_atual = "0000" && reqLeit='1')
                prox_estado <= "0001"
            end if;
            
            if (estado_atual = "0001" && reqLeit='1' && ack_entrada='0')
                ack_saida <= '1';
                ler <= '0';
                prox_estado <="0010";

            elsif (estado_atual = "0010" && reqLeit='0' && ack_entrada='0')
                ack_saida <= '0';
                ler <= '1';
                dadoPrt <= '1';
                prox_estado <="0011";

            elsif (estado_atual = "0011" && reqLeit='0' && ack_entrada='1')
                dadoPrt <= '0';
                ler <= '0';
                prox_estado <= "0000";
            
            end if;

            estado_atual <= prox_estado;


        end process;
end behavior;
