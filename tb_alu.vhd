library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ALU is
end tb_ALU;

architecture Behavioral of tb_ALU is
    component ALU is
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            ALU_Sel: in  STD_LOGIC_VECTOR(2 downto 0);
            ALU_Out: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Inputs
    signal A      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal ALU_Sel: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    -- Outputs
    signal ALU_Out: STD_LOGIC_VECTOR(7 downto 0);

begin
    uut: ALU Port map (
        A      => A,
        B      => B,
        ALU_Sel=> ALU_Sel,
        ALU_Out=> ALU_Out
    );

    stim_proc: process
    begin
        -- Test Addition
        A <= "00000010"; B <= "00000011"; ALU_Sel <= "000"; wait for 100 ns;
        -- Test Subtraction
        A <= "00000100"; B <= "00000010"; ALU_Sel <= "001"; wait for 100 ns;
        -- Test AND
        A <= "00001100"; B <= "00001010"; ALU_Sel <= "010"; wait for 100 ns;
        -- Test OR
        A <= "00001100"; B <= "00001010"; ALU_Sel <= "011"; wait for 100 ns;
        -- Test Right Shift
        A <= "00001100"; ALU_Sel <= "100"; wait for 100 ns;
        -- Test Left Shift
        A <= "00001100"; ALU_Sel <= "101"; wait for 100 ns;
        -- Test Increment
        A <= "00001100"; ALU_Sel <= "110"; wait for 100 ns;
        -- Test Decrement
        A <= "00001100"; ALU_Sel <= "111"; wait for 100 ns;

        wait;
    end process;

end Behavioral;
