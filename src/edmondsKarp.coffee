## From http://en.wikipedia.org/wiki/Edmonds%E2%80%93Karp_algorithm ##

edmondsKarp = (edges, capacity, s, t) ->
  n = edges.length
  flow = (((0 for j in [0...n] by 1)) for i in [0...n] by 1)          # [n][n] table of flows, init'd at 0
  loop
    parent = (-1 for i in [0...n] by 1)                               # parent table
    parent[s] = s
    M = (0 for i in [0...n] by 1)                                     # capacity of path to node
    M[s] = Infinity
    queue = [s]                                                       # BFS Stack
    _break = false                                                    # A little ugly, as we can't used labeled loops in CoffeeScript
    while queue.length and not _break
      u = queue.pop()
      for v in edges[u]
        if (capacity[u][v] - flow[u][v] > 0) and parent[v] is -1      # residual capacity from u to v is capacity[u][v] - flow[u][v]
          parent[v] = u
          M[v] = Math.min(M[u], capacity[u][v] - flow[u][v])
          unless v is t
            queue.push v
          else
            # backtrack and write flow
            while parent[v] isnt v
              u = parent[v]
              flow[u][v] += M[t]
              flow[v][u] -= M[t]
              v = u
            _break = true
            break
    if parent[t] is -1                # we did not find a path to t
      maxFlow = 0
      for x in flow[s]
        maxFlow += x
      return {maxFlow, flow}
