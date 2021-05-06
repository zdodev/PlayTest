import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var data = [
        Person(firstName: "Dan", lastName: "a", gender: "male", age: 25, height: 144),
        Person(firstName: "Betty", lastName: "r", gender: "famale", age: 35, height: 144),
        Person(firstName: "John", lastName: "z", gender: "male", age: 35, height: 144),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let model = data[indexPath.row]
        cell.configure(with: CellViewModel(firstName: model.firstName, lastName: model.lastName))
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
}

struct CellViewModel {
    let firstName: String
    let lastName: String
}
