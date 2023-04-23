import networkx as nx

filename = "top250movies.txt"

# Read the data from the file and create the network
try:
    G = nx.Graph()
    with open(filename, encoding="utf-8") as f:
        for line in f:
            cast = line.strip().split("/")
            for i in range(1, len(cast)):
                for j in range(1, i):
                    actor1 = cast[i]
                    actor2 = cast[j]
                    if G.has_edge(actor1, actor2):
                        G[actor1][actor2]["weight"] += 1
                    else:
                        G.add_edge(actor1, actor2, weight=1)

    # Compute the PageRank vector and write the list of ranked actors to a file
    pr = nx.pagerank(G)
    ranked_actors = sorted(pr, key=pr.get, reverse=True)
    with open("q1/ranked_actors.txt", "w", encoding="utf-8") as out_file:
        for actor in ranked_actors:
            out_file.write(actor + "\n")
except FileNotFoundError:
    print("Error: " + filename + " not found.")
except Exception as e:
    print("An error occurred:", e)
