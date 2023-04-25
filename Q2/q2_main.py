from q2 import *
import numpy as np

q1_filename = "train.data"
q2_filename = "validate.data"
output_filename = "least_squares_solution.txt"

# Question 1

print( "Part A" )
print( "----------" )
q2_least_squares = least_squares(q1_filename)
print(q2_least_squares)
print( "----------" )

print( "\nPart B" )
q2_b = (malignant_or_benign(q2_filename))
print(q2_b)
print( "----------" )

print( "\nPart C" )
# q2_c = error_rate(q2_filename)
print( "----------" )