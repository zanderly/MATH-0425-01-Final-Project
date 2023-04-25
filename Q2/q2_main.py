from q2 import *
import numpy as np

train_data = "train.data"
validate_data = "validate.data"
output_filename = "least_squares_solution.txt"

# Question 1

print( "Part A" )
print( "----------" )
q2_least_squares = least_squares(train_data)
print(q2_least_squares)
print( "----------" )

print( "\nPart B" )
q2_b = (malignant_or_benign(validate_data))
print(q2_b)
print( "----------" )

# print( "\nPart C" )
# x = malignant_or_benign(train_data)
# y = malignant_or_benign(validate_data)
# q2_c = error_rate(x, y)
# print(q2_c)
# print( "----------" )