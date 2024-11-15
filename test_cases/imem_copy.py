import shutil
import os

path = r"C:\Users\HGBread\Desktop\MSEE\577b\project_p3\ee577b_phase3\test_cases"
# Specify the path of the file you want to copy
source_file = path + os.sep + "imem_0.0.fill"

# Loop to copy the file 16 times
for i in range(16):
    # Define the new file name, appending the copy number to the original file name
    new_file = path + os.sep + f"imem_core{i}.fill"
    # Copy the file
    shutil.copy(source_file, new_file)
    print(f"Copied {source_file} to {new_file}")
