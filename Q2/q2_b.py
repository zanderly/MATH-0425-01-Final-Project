import numpy as np

from efficient_cancer_data import read_training_data

filename = "validate.data"

# Step 1: Read the training data
try:
    A, b = read_training_data(filename)
except FileNotFoundError:
    raise IOError(f"Error: Could not find file {filename}")
except ValueError:
    raise ValueError(f"Error: Invalid data in file {filename}")


# Step 2: Compute the predictions



# Step 3: Define the classifier function


# Step 4: Apply the classifier function to the predictions to get the final predictions


# Print the final predictions

