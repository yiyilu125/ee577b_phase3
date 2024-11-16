import os

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

# Function to generate instructions
def generater_inst(instruction):
    parts = instruction.lower().split()  # Convert entire input to lowercase
    opcode = parts[0]

    if opcode == "nop":
        return "32'hF0000000"

    if len(parts) != 3:
        raise ValueError(f"Instruction format error for: {instruction}")

    reg_x = int(parts[1][1:])  # Extract x from Rx
    y = int(parts[2])

    if reg_x < 0 or reg_x > 31:
        raise ValueError(f"Register index out of range (0-31): R{reg_x}")
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

    binary_representation = f"{opcode_mapping[opcode]}{reg_x:05b}00000{y:05b}"
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
        print("1. Generate DMEM files")
        print("2. Enter instructions and generate hex")
        print("3. Exit")
        choice = input("Enter your choice: ").strip().lower()  # Lowercase for consistent input

        if choice == "1":
            generate_dmem_files()
        elif choice == "2":
            output_file = FILE_PATH + os.sep + "imem_test.fill"
            with open(output_file, "w") as file:
                while True:
                    user_input = input("Enter instruction (or 'exit' to go back): ").strip()
                    if user_input.lower() == "exit":
                        print(f"Hex instructions written to {output_file}. Returning to main menu.")
                        break
                    try:
                        hex_instruction = generater_inst(user_input)
                        print(f"{hex_instruction}  // {user_input.upper()}")
                        file.write(f"{user_input} -> {hex_instruction}\n")
                    except ValueError as e:
                        print(e)
        elif choice == "3":
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
