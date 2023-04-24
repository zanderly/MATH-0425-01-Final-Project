import numpy as np
from efficient_cancer_data import read_training_data

filename = "train.data"

# Step 1: Read the training data
try:
    A, b = read_training_data(filename)
except FileNotFoundError:
    raise IOError(f"Error: Could not find file {filename}")
except ValueError:
    raise ValueError(f"Error: Invalid data in file {filename}")

# Step 2: Compute the QR decomposition of A
Q, R = np.linalg.qr(A)

# Step 3: Compute the least squares solution x
x = np.dot(np.dot(np.linalg.inv(R), Q.T), b)

# Step 4: Print the solution x
print("The least squares solution is:\n", x)