import UIKit

class ViewController: UIViewController {
    let button: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        navigationItem.title = "메모"
    }
    
    override func viewDidLayoutSubviews() {
        print(view.frame)
        print(view.bounds)
        print(view.layoutMargins)
        button.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(printViewMode), for: .touchUpInside)
    }
    
    @objc func printViewMode() {
        print(traitCollection.horizontalSizeClass.rawValue)
        print(traitCollection.verticalSizeClass.rawValue)
    }
}

