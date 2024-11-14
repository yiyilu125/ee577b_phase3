import shutil

# Specify the path of the file you want to copy
source_file = 'imem_0.0.fill'

# Loop to copy the file 16 times
for i in range(1, 17):
    # Define the new file name, appending the copy number to the original file name
    new_file = f'imem_core{i}.fill'
    # Copy the file
    shutil.copy(source_file, new_file)
    print(f"Copied {source_file} to {new_file}")
