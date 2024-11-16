import os
import shutil

# Define the constant path
FILE_PATH = r"ee577b_phase3/test_cases"

# Function to generate DMEM data
def generater_data(src, des):
    src_x = src % 4
    src_y = src // 4
    des_x = des % 4
    des_y = des // 4

    hop_x = abs(des_x - src_x)
    dir_1 = 1 if des_x > src_x else 0
    hop_y = abs(des_y - src_y)
    dir_0 = 1 if des_y > src_y else 0
    dir = (dir_1 << 1) | dir_0

    dmem_data = (0b0 << 63) | (dir << 61) | (0b00000 << 56) | (hop_x << 52) | \
                (hop_y << 48) | (src_x << 40) | (src_y << 32) | (0xDA << 24) | (0x111111 * src)

    return dmem_data


def copy_imem_files(path):
    # Specify the source file
    source_file = os.path.join(path, "imem_core0.fill")
    
    # Loop to copy the file 16 times
    for i in range(16):
        # Define the new file name, appending the copy number to the original file name
        new_file = os.path.join(path, f"imem_core{i}.fill")
        # Copy the file
        shutil.copy(source_file, new_file)

    print("**all 16 imem files generated**")


# Function to generate instructions
def generater_inst(instruction):
    parts = instruction.lower().split()  # Convert entire input to lowercase
    opcode = parts[0]

    if opcode == "nop":
        return "F0000000"

    if len(parts) != 3:
        raise ValueError(f"Instruction format error for: {instruction}")

    reg_x_part = parts[1]
    y = int(parts[2])

    if reg_x_part == "nic":
        reg_x = -1  # Special case to indicate "nic"
    else:
        reg_x = int(reg_x_part[1:])  # Extract x from Rx

        if reg_x < 0 or reg_x > 31:
            raise ValueError(f"Register index out of range (0-31): {reg_x}")        
    if y < 0 or y > 31:
        raise ValueError(f"Immediate value out of range (0-31): {y}")

    opcode_mapping = {
        "bez": "100010",
        "bnez": "100011",
        "ld": "100000",
        "sd": "100001"
    }

    if opcode not in opcode_mapping:
        raise ValueError(f"Unsupported opcode: {opcode}")
    if opcode in {"bez", "bnez"}:
        y *= 4

    if reg_x_part == "nic":
        binary_representation = f"{opcode_mapping[opcode]}{reg_x:05b}00000011{y:013b}"
    else:
        binary_representation = f"{opcode_mapping[opcode]}{reg_x:05b}00000{y:016b}"
    hex_value = f"{int(binary_representation, 2):08X}"

    return hex_value

# Function to generate DMEM files
def generate_dmem_files():
    os.makedirs(FILE_PATH, exist_ok=True)
    src_values = range(16)
    for src in src_values:
        filename = FILE_PATH + os.sep + f"dmem_core{src}.fill"
        with open(filename, "w") as file:
            for des in range(16):
                if src != des:
                    dmem_data = generater_data(src, des)
                    file.write(f"{dmem_data:016x}  // c{src} to c{des}\n")
        print(f"Results written to {filename}")

# Main function with menu
def main():
    while True:
        print("\nChoose an option:")
        print("1. Generate DMEM files (each node sends to all other nodes)")
        print("2. Generate IMEN files (type in instructions and generate)")
        print("3. Exit\n")
        choice = input(" main >> ").strip().lower()  # Lowercase for consistent input

        if choice == "1":
            generate_dmem_files()
        elif choice == "2":
            output_file = FILE_PATH + os.sep + "imem_test.fill"
            core = input("which to write ('test', 'all', or a 0-15 decimal number)\n core >> ").strip().lower()

            if core == "test":
                output_file = FILE_PATH + os.sep + "imem_test.fill"
            elif core == "all":
                output_file = FILE_PATH + os.sep + "imem_core0.fill"
            elif core.isdigit() and 0 <= int(core) <= 15:
                core_index = int(core)
                output_file = FILE_PATH + os.sep + f"imem_core{core_index}.fill"
            else:
                print("Invalid input. Please enter 'test', 'all', or a decimal number between 0 and 15.")
                continue

            with open(output_file, "w") as file:
                while True:
                    user_input = input("Enter Inst: ('finish' to go back)\n imem >> ").strip()
                    if user_input.lower() == "finish":
                        if core == "all":
                            copy_imem_files(FILE_PATH)
                        print(f"Instructions written to {output_file}. Returning to main menu.")
                        break
                    try:
                        hex_instruction = generater_inst(user_input)
                        print(f"{hex_instruction}  // {user_input.upper()}")
                        file.write(f"{user_input} -> {hex_instruction}\n")
                    except ValueError as e:
                        print(e)
        elif choice == "3":
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
