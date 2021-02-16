import UIKit

final class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    let data = ["while", "black", "red", "cyan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(textView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "메모"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
    }
    
    override func viewDidLayoutSubviews() {
        switch traitCollection.horizontalSizeClass {
        case .compact:
            displayListView()
        case .regular:
            displayMemoView()
        case .unspecified:
            print("unspecified.")
        @unknown default:
            fatalError()
        }
        tableView.reloadData()
    }
    
    private func displayListView() {
        searchBar.frame = CGRect(x: 0, y: view.layoutMargins.top, width: view.frame.width, height: 50)
        tableView.frame = CGRect(x: 0, y: searchBar.frame.origin.y + searchBar.frame.height, width: view.frame.width, height: view.frame.height - searchBar.frame.origin.y + searchBar.frame.height)
        textView.isHidden = true
    }
    
    private func displayMemoView() {
        searchBar.frame = CGRect(x: 0, y: view.layoutMargins.top, width: view.frame.width / 3, height: 50)
        tableView.frame = CGRect(x: 0, y: searchBar.frame.origin.y + searchBar.frame.height, width: view.frame.width / 3, height: view.frame.height - searchBar.frame.origin.y + searchBar.frame.height)
        textView.frame = CGRect(x: view.frame.width / 3, y: view.layoutMargins.top, width: view.frame.width - view.frame.width / 3, height: view.frame.height - searchBar.frame.origin.y + searchBar.frame.height)
        textView.isHidden = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        data.count
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.textLabel?.text = data[indexPath.row]
        print(indexPath)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
