import os

path = r"ee577b_phase3\test_cases"

def generate_dmem(src, des):
    # Calculate src_x, src_y, des_x, des_y
    src_x = src % 4
    src_y = src // 4
    des_x = des % 4
    des_y = des // 4
    
    # Calculate hop_x, hop_y, and directions
    hop_x = abs(des_x - src_x)
    dir_1 = 1 if des_x > src_x else 0
    hop_y = abs(des_y - src_y)
    dir_0 = 1 if des_y > src_y else 0
    dir = (dir_1 << 1) | dir_0  # Combine dir[1] and dir[0] into a 2-bit direction
    
    # Construct dmem_data according to Verilog logic
    dmem_data = (0b0 << 63) | (dir << 61) | (0b00000 << 56) | (hop_x << 52) | (hop_y << 48) | (src_x << 40) | (src_y << 32) | (0xDA<< 24) | (0x111111 * src)
        
    return dmem_data

# Set the range of src values you want to test
src_values = range(16)  # Example range for src from 1 to 2; adjust as needed

for src in src_values:
    # Open a file for each src value
    
    filename = path + os.sep + f"dmem_core{src}.fill"
    with open(filename, "w") as file:
        for des in range(16):  # Loop over destination values from 0 to 15
            if (src != des) :
                dmem_data = generate_dmem(src, des)
                # Write the result in hexadecimal format for readability
                file.write(f"{dmem_data:016x}  // c{src} to c{des}\n")
    print(f"Results written to {filename}")
