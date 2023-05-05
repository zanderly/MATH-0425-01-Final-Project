#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar  7 16:30:14 2023

@author: henryboateng
"""
from imp import reload
from numpy import array, identity, ones, nonzero, zeros
from numpy import linalg as LA

from PageRank_module import pageRank

# PageRank for mini-web links for Stanford
links=set()
with open("q1/web_stanford.txt","r") as f:
    for line in f:
        
        #print(line)
        ls=line.rstrip("\n").split("/")
        #print(set(map(int, ls)))
        links.update(set(map(int, ls)))

f.close()        
# Create adjacency matrix
links=sorted(links)  #sort the IDs of the webpages into a list
n = len(links)
G = zeros((n,n))

with open("data/web_stanford.txt","r") as f:
    for line in f:
        ls=line.rstrip("\n").split("/")
        lIDs = map(int, ls) #IDs on the line
        row = [] # row indices of IDS
        for i in lIDs:
            row.append(links.index(i))
            
        j = row[0] # First element is column index
        # Link page j to page i, i.e. set G_{ij} to 1 
        G[row[1:],j] = 1.0

f.close()  

netw=pageRank(G,links,0.85,1e-6,15)  
prv = netw.linsolve()