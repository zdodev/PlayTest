import UIKit

class ViewController: UIViewController {
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loginButton = UIButton(type: .system)
        loginButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .black
        loginButton.tintColor = .cyan
        view.addSubview(loginButton)
    }
}

