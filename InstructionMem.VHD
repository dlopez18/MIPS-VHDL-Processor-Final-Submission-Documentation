library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMem is
    Port(
    reg_addy : in  std_logic_vector(31 downto 0);
    
        instr   : out std_logic_vector(31 downto 0) );
end InstructionMem;

architecture Behavioral of InstructionMem is

    type reg is array (0 to 1500) of std_logic_vector(7 downto 0);
    signal instr_mem: reg := (
    --Since it is 32 bit, we split the reg into 4 values we later combine 
    -- addi $R1,$R0,30
    0 => "00100000",
    1 => "00000001",
    2 => "00000000",
    3 => "00011110",
    
    -- sw $R1,0($R0)
    4 => "10101100",
    5 => "00000001",
    6 => "00000000",
    7 => "00000000",
    
    -- lw $R3,0($R0)
    8 => "10001100",
    9 => "00000011",
    10 => "00000000",
    11 => "00000000",
    
    -- srl $R7,$R3,1
    12 => "00000000",
    13 => "01100000",
    14 => "00111000",
    15 => "01000010",
    
    -- sll $R8,$R7,1
    16 => "00000000",
    17 => "11100000",
    18 => "01000000",
    19 => "01000000",
    
    -- addi $R2,$R0,27
    20 => "00100000",
    21 => "00000010",
    22 => "00000000",
    23 => "00011011",
    
    -- addi $R2,$R2,1
    24 => "00100000",
    25 => "01000010",
    26 => "00000000",
    27 => "00000001",
    
    -- sw $R2,1($R0)
    28 => "10101100",
    29 => "00000010",
    30 => "00000000",
    31 => "00000001",
    
    -- sub $R3,$R1,$R2
    32 => "00000000",
    33 => "00100010",
    34 => "00011000",
    35 => "00100010",
    
    -- beq $R1,$R2,1
    36 => "00010000",
    37 => "00100010",
    38 => "00000000",
    39 => "00000001",
    
    -- j 6
    40 => "00001000",
    41 => "00000000",
    42 => "00000000",
    43 => "00000110",
    
    -- sw $R2,3($R0)
    44 => "10101100",
    45 => "00000010",
    46 => "00000000",
    47 => "00000011",
    
    -- lw $R10,3($R0)
    48 => "10001100",
    49 => "00001010",
    50 => "00000000",
    51 => "00000011",
    
        others => "00000000" );
    
    begin       --Splitting up the  
      instr <=       instr_mem(to_integer(unsigned(reg_addy)))     &
                     instr_mem(to_integer(unsigned(reg_addy) + 1)) &
                     instr_mem(to_integer(unsigned(reg_addy) + 2)) &
                     instr_mem(to_integer(unsigned(reg_addy) + 3));



end Behavioral;