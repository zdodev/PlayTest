import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.backgroundColor = UIColor.darkGray
        btn.layer.cornerRadius = 25
        btn.tintColor = UIColor.white
        btn.titleLabel?.textColor = UIColor.white
    }
}
