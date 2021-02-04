import Foundation

enum NetworkError: Error {
    case badURL
}


func fetchUnreadCount(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(.badURL))
        return
    }
    
    print("Fetching \(url.absoluteString)")
    completionHandler(.success(5))
}

fetchUnreadCount(from: "https://hackingwithswift.com") { result in
    switch result {
    case .success(let count):
        print("\(count) unread messages.")
    case .failure(let error):
        print(error.localizedDescription)
    }
}

fetchUnreadCount(from: "https://hackingwithswift.com") { result in
    switch result {
    case .success(let count):
        print("\(count) unread messages.")
    case .failure(let error):
        print(error.localizedDescription)
    }
}
