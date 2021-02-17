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
    
    var memoData = [MemoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(textView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        guard let dataAsset = NSDataAsset(name: "sample") else {
            return
        }
//        /Users/zdo/Documents/test/iOSTest/iOSTest/Assets.xcassets
        let fileManager = FileManager.default
        let rootPath = URL(string: #file)
        print(rootPath)
    
        do {
            memoData = try JSONDecoder().decode([MemoItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
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
        tableView.frame = CGRect(x: 0, y: searchBar.frame.origin.y + searchBar.frame.height, width: view.frame.width, height: view.frame.height - searchBar.frame.origin.y - searchBar.frame.height)
        textView.isHidden = true
    }
    
    private func displayMemoView() {
        searchBar.frame = CGRect(x: 0, y: view.layoutMargins.top, width: view.frame.width / 3, height: 50)
        tableView.frame = CGRect(x: 0, y: searchBar.frame.origin.y + searchBar.frame.height, width: view.frame.width, height: view.frame.height - searchBar.frame.origin.y - searchBar.frame.height)
        textView.frame = CGRect(x: view.frame.width / 3, y: view.layoutMargins.top, width: view.frame.width - view.frame.width / 3, height: view.frame.height - searchBar.frame.origin.y + searchBar.frame.height)
        textView.isHidden = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configure(with: memoData[indexPath.row])
        textView.text = memoData[indexPath.row].body
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textView.text = memoData[indexPath.row].body
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        do {
//            let modifiedData = try JSONEncoder().encode(memoData)
//            let url = URL()
//            modifiedData.write(to: <#T##URL#>)
//            enco([MemoItem].self, from: dataAsset.data)
//        } catch {
//            print(error.localizedDescription)
//        }
    }
}
