from efficient_cancer_data import read_training_data

# Step 1: Read the validation data
try:
    A_val, b_val = read_training_data("validate.data")
except FileNotFoundError:
    print("Error: Could not find file validate.data")
    exit(1)
except ValueError:
    print("Error: Invalid data in file validate.data")
    exit(1)

# Step 2: Compute the predictions


# Step 3: Define the classifier function


# Step 4: Apply the classifier function to the predictions to get the final predictions


# Print the final predictions

