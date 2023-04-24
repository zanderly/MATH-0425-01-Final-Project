import numpy as np
from efficient_cancer_data import read_training_data

filename = "train.data"


# Step 1: Read the training data
try:
    A, b = read_training_data(filename)
except FileNotFoundError:
    print(f"Error: Could not find file {filename}")
    exit(1)
except ValueError:
    print(f"Error: Invalid data in file {filename}")
    exit(1)

# Step 2: Compute the QR decomposition of A

# Step 3: Compute the least squares solution x

# Step 4: Print the solution x
