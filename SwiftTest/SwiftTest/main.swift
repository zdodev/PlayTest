import Foundation

let graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7],
]

func bfs(_ graph: [[Int]], _ start: Int) {
    var queue = [start]
    var visited = Array(repeating: false, count: graph.count)
    visited[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")
        
        for next in graph[v] {
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            }
        }
    }
}

var visited = Array(repeating: false, count: graph.count)

func dfs(_ graph: [[Int]], _ vertex: Int) {
    visited[vertex] = true
    print(vertex, terminator: " ")
    
    for v in graph[vertex] {
        if !visited[v] {
            dfs(graph, v)
        }
    }
}

dfs(graph, 1)
