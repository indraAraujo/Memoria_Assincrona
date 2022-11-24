library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TB is
end entity;

architecture behavior of TB is

    component fsm is port (
		reqLeit     : in std_logic;
        ack_entrada : in std_logic();
        ack_saida   : out
        dadoPrt     : out std_logic);
    end component;

    component memory is port (
        ler         : in std_logic;
        endereco    : in std_logic_vector(7 downto 0);
        resposta    : out std_logic_vector(7 downto 0);
    end component);

    signal Requisita_Leitura : std_logic:='0';

begin
    mef: fsm port map(
		reqLeit     <= Requisita_Leitura,
        ack_entrada : ,
        ack_saida   : ,
        dadoPrt     : );

        mem: memory port map(
            ler         : ,
            endereco    : ,
            resposta    : );


    

end behavior;