import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("cumstom back button.")
        navigationItem.leftItemsSupplementBackButton = true
    }
}
