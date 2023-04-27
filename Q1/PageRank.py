import networkx as nx

input_file_name = "top250movies.txt"
output_file_name = "ranked_actors.txt"

# Read the data from the file and create the network
# try:
#     G = nx.Graph()
#     with open(input_file_name, encoding="utf-8") as f:
        
#     with open(output_file_name, "w", encoding="utf-8") as out_file:
#         for actor in ranked_actors:
#             out_file.write(actor + "\n")
# except FileNotFoundError:
#     print("Error: " + input_file_name + " not found.")
# except Exception as e:
#     print("An error occurred:", e)
