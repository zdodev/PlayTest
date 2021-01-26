import Foundation

struct Request {
    func requestItemList(requestURL: String) {
        guard let url = URL(string: requestURL) else {
            return
        }
        print(url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, urlResponse, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(ItemList.self, from: data)
                    print(decodedData)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func requestItem(requestURL: String) {
        guard let url = URL(string: requestURL) else {
            return
        }
        print(url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, urlResponse, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(Item.self, from: data)
                    print(decodedData)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

struct ItemList: Decodable {
    let page: Int
    let items: [Item]
}

struct Item: Decodable {
    let id: Int
    let title: String
    let price: Int
    let currency: String
    let stock: Int
    let discountedPrice: Int?
    let thumbnails: [String]
    let registrationDate: Double
    let descriptions: String?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currency
        case stock
        case discountedPrice = "discounted_price"
        case thumbnails
        case registrationDate = "registration_date"
        case descriptions
        case images
    }
}

let request = Request()
//request.requestItemList(requestURL: "https://camp-open-market.herokuapp.com/items/1")
request.requestItem(requestURL: "https://camp-open-market.herokuapp.com/item/30")

Thread.sleep(forTimeInterval: 5)
