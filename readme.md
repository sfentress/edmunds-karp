Edmunds-Karp Algorithm
======================

Written using pseudocode at http://en.wikipedia.org/wiki/Edmonds%E2%80%93Karp_algorithm

Example
-------

Given the network

       1
      / \
     /   \
    0-----2

where 0 is the source, 2 is the sink, and the capacities on each edge are

    0-1: 5
    1-2: 4
    0-2: 3

how much flow can we push from the source to the sink, and how much flows along each edge?

We represent the graph by specifying the vertices of each edge

    edges = [ [ 1, 2 ],
              [ 0, 2 ],
              [ 0, 1 ] ]

We represent the capacities as a matrix between the vertices

    capacity = [ [ 0, 5, 3 ],
                 [ 5, 0, 4 ],
                 [ 3, 4, 0 ] ];

And call the function giving the source node and the sink node.

    edmondsKarp(edges, capacity, 0, 2);

We get both the maxFlow and the flows between each vertex:

    { maxFlow: 7,
      flow:
       [ [ 0, 4, 3 ],
         [ -4, 0, 4 ],
         [ -3, -4, 0 ] ] }

Running in Node
---------------

    $ node
    > e = require('path/to/edmondsKarp.js')
    > edges = [[1,2],[0,2],[0,1]]
    > capacity = [[0,5,3],[5,0,4],[3,4,0]]
    > e.edmondsKarp(edges, capacity, 0, 2)
    { sum: 7,
      flow:
       [ [ 0, 4, 3 ],
         [ -4, 0, 4 ],
         [ -3, -4, 0 ] ] }
