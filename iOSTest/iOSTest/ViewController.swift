import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func loadView() {
        super.loadView()
        print(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("까궁")
    }
}
