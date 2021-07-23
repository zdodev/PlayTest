import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        label.text = NSLocalizedString("Hello", comment: "")
    }
}
