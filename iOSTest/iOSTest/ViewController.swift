import UIKit

class ViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(searchBar)
        navigationItem.title = "메모"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
    }
    
    override func viewDidLayoutSubviews() {
        searchBar.frame = CGRect(x: 0, y: view.layoutMargins.top, width: view.frame.width, height: 50)
        searchBar.placeholder = "Search"
    }
    
    @objc func printViewMode() {
        print(traitCollection.horizontalSizeClass.rawValue)
        print(traitCollection.verticalSizeClass.rawValue)
    }
}

