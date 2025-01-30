class Graph {
    private var adjList = [Int: [Int]]()
    
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
}

let graph = Graph()
graph.addEdge(0, 1)
graph.addEdge(0, 2)
graph.addEdge(1, 3)
graph.addEdge(1, 4)
graph.addEdge(2, 5)
graph.addEdge(2, 6)

graph.bfs(start: 0)
