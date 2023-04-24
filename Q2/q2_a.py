import numpy as np
from efficient_cancer_data import read_training_data

input_file_name = "train.data"
output_file_name = "least_squares_solution.txt"

# Step 1: Read the training data
try:
    A, b = read_training_data(input_file_name)
except FileNotFoundError:
    raise IOError(f"Error: Could not find file {input_file_name}")
except ValueError:
    raise ValueError(f"Error: Invalid data in file {input_file_name}")

# Step 2: Compute the QR decomposition of A
Q, R = np.linalg.qr(A)

# Step 3: Compute the least squares solution x
x = np.dot(np.dot(np.linalg.inv(R), Q.T), b)

# Step 4: Print the solution x
with open(output_file_name, "w") as f:
    f.write("The least squares solution is:\n")
    for i in range(len(x)):
        f.write(str(x[i][0]) + "\n")
