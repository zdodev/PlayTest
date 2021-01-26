import UIKit

class ViewController: UIViewController {
//    let boundary = "\(UUID().uuidString)"
    let boundary = "64800cc55bc54c3cbfa850a76569f9d4"
    
    @IBAction func get(_ sender: UIButton) {
        guard let url = URL(string: "https://camp-open-market.herokuapp.com/item") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = createDataBody(withParameters: "ee")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                print(data)
                let decode = try! JSONDecoder().decode(Model.self, from: data)
                print(decode)
            }
        }.resume()
    }
    
    func createDataBody(withParameters params: String) -> Data {
        var body = Data()
        body.append(makeParameter(parameter: "title", value: "test1"))
        body.append(makeParameter(parameter: "descriptions", value: "test1"))
        body.append(makeParameter(parameter: "price", value: "1234"))
        body.append(makeParameter(parameter: "currency", value: "USD"))
        body.append(makeParameter(parameter: "stock", value: "5000"))
        body.append(makeParameter(parameter: "password", value: "1234"))
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }
    
    func makeParameter(parameter: String, value: String) -> Data {
        var body = Data()
        
        let first = "--\(boundary)\r\n".data(using: .utf8)!
        let stringData = "Content-Disposition: form-data; name=\"\(parameter)\"\r\n\r\n".data(using: .utf8)!
        let data = value.data(using: .utf8)!
        let lineBreak = "\r\n".data(using: .utf8)!
        body.append(first)
        body.append(stringData)
        body.append(data)
        body.append(lineBreak)
        return body
    }
}

struct Model: Decodable {
    let id: Int
    let title: String
    let descriptions: String
    let price: Int
    let currency: String
    let thumbnails: [String]
    let images: [String]
}
