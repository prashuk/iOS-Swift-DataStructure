class Graph {
    var adjList = [Int: [Int]]()
    
    func addEdge(_ from: Int, _ to: Int) {
        adjList[from, default: []].append(to)
        adjList[to, default: []].append(from) // remove for directed graph
    }
    
    // BFS
    func bfs(start: Int) {
        var visited = Set<Int>()
        var queue = [start]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if !visited.contains(node) {
                print(node)
                visited.insert(node)
                queue.append(contentsOf: adjList[node] ?? [])
            }
        }
    }
    
    // DFS
    func dfs(start: Int) {
        var visited = Set<Int>()
        dfsHelper(node: start, visited: &visited)
    }
    
    func dfsHelper(node: Int, visited: inout Set<Int>) {
        guard !visited.contains(node) else { return }
        
        print(node)
        visited.insert(node)
        
        for neighbor in adjList[node] ?? [] {
            dfsHelper(node: neighbor, visited: &visited)
        }
    }
}

let graph = Graph()
graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
graph.addEdge(1, 4)
graph.addEdge(2, 5)
graph.addEdge(2, 6)

print(graph.adjList)
print("---")
graph.bfs(start: 0)
print("---")
graph.dfs(start: 0)

// Use BFS when searching for the shortest path or when the solution is close to the root. QUEUE
// Use DFS when dealing with deep recursion-based problems, cycle detection, or topological sorting. 
