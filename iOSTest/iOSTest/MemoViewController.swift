import UIKit

class MemoViewController: UIViewController {
    let textView: UITextView = {
        let textView = UITextView()
        textView.dataDetectorTypes = .all
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        
        textView.frame = view.frame
    }
}
