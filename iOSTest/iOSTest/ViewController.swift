import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
//        print(view.constraints.first!)
        let const = view.constraints[1]
        const.constant += 10
    }
}
