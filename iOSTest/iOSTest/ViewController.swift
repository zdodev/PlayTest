import UIKit

class ViewController: UIViewController {
    var loginButton: UIButton!
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loginButton = UIButton(type: .system)
        loginButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .black
        loginButton.tintColor = .cyan
        view.addSubview(loginButton)
        
        var count = 0
        for row in 5...10 {
            count += 1
            sum += row
        }
        print("총 합은 \(self.sum), \(count)ghl 실행되었습니다.")
    }
}

