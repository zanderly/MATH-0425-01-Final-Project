import numpy as np
from efficient_cancer_data import read_training_data


# Function to compute the least squares solution
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

# Classifier function
def C(y):
    if y >= 0:
        return 1
    else:
        return -1

# Function to compute the predictions
def malignant_or_benign(filename):
    # Step 1: Read the training data
    try:
        A, b = read_training_data(filename)
    except FileNotFoundError:
        raise IOError(f"Error: Could not find file {filename}")
    except ValueError:
        raise ValueError(f"Error: Invalid data in file {filename}")

    x = least_squares(filename)
    
    # Step 2: Compute the predictions
    predictions = np.dot(A, x)

    # Step 3: Apply the classifier function to the predictions to get the final predictions
    final_predictions = [C(y) for y in predictions]

    # Print the final predictions
    return final_predictions

    


# def error_rate(x):

#     # We are comparing the performance of the linear model on the training data 
#     # and the validation data to evaluate its generalization ability.
    
#     return(f"Percentage of incorrectly classified samples: {percentage:.2f}%")


# error_rate(x)
