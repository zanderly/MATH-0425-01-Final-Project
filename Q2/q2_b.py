from efficient_cancer_data import read_training_data, read_validation_data

# Step 1: Read the validation data
try:
    A_val, b_val = read_validation_data("validate.data")
except FileNotFoundError:
    print("Error: Could not find file validate.data")
    exit(1)
except ValueError:
    print("Error: Invalid data in file validate.data")
    exit(1)

# Step 2: Compute the predictions
pred = A_val @ x

# Step 3: Define the classifier function
def C(y):
    return 1 if y >= 0 else -1

# Step 4: Apply the classifier function to the predictions to get the final predictions
final_pred = [C(p) for p in pred]

# Print the final predictions
print(final_pred)
