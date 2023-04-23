from efficient_cancer_data import read_training_data
import numpy as np

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
Q, R = np.linalg.qr(A)

# Step 3: Solve the linear system to obtain the least-squares linear model coefficients

x = np.linalg.solve(R, Q.T @ b)

# Print the coefficients
print(x)
