import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = textView.text!
        print(text)
        print(text.split(separator: "\u{2028}"))
    }
}
