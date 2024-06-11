library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_Sel: in  STD_LOGIC_VECTOR(2 downto 0);
        ALU_Out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, ALU_Sel)
    begin
        case ALU_Sel is
            when "000" => -- Addition
                ALU_Out <= std_logic_vector(unsigned(A) + unsigned(B));
            when "001" => -- Subtraction
                ALU_Out <= std_logic_vector(unsigned(A) - unsigned(B));
            when "010" => -- AND
                ALU_Out <= A and B;
            when "011" => -- OR
                ALU_Out <= A or B;
            when "100" => -- Right Shift
                ALU_Out <= std_logic_vector(shift_right(unsigned(A), 1));
            when "101" => -- Left Shift
                ALU_Out <= std_logic_vector(shift_left(unsigned(A), 1));
            when "110" => -- Increment
                ALU_Out <= std_logic_vector(unsigned(A) + 1);
            when "111" => -- Decrement
                ALU_Out <= std_logic_vector(unsigned(A) - 1);
            when others =>
                ALU_Out <= (others => '0');
        end case;
    end process;
end Behavioral;
