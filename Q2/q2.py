import numpy as np
from efficient_cancer_data import read_training_data

q1_filename = "train.data"
q2_filename = "validate.data"
output_filename = "least_squares_solution.txt"

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

# Print the least squares solution for the training data
print(least_squares(q1_filename))


def malignant_or_benign(x):
    # Step 1: Read the training data
    try:
        A, b = read_training_data(q2_filename)
    except FileNotFoundError:
        raise IOError(f"Error: Could not find file {q2_filename}")
    except ValueError:
        raise ValueError(f"Error: Invalid data in file {q2_filename}")

    x = least_squares("input_file_name")
    # Step 2: Compute the predictions

    # predictions = np.dot(A, x) ????

    # Step 3: Define the classifier function

    def C(y):
        if y >= 0:
            return 1
        else:
            return -1


    # Step 4: Apply the classifier function to the predictions to get the final predictions


    # Print the final predictions
    
    # return final_predictions
    
print(malignant_or_benign(q2_filename))


