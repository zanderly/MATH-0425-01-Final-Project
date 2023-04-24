import numpy as np
from efficient_cancer_data import read_training_data

input_file_name = "train.data"
output_file_name = "least_squares_solution.txt"

def least_squares(filename):
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

    # Step 4: Return the solution x
    return x

print(least_squares(input_file_name))