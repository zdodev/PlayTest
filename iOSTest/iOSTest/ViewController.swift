import UIKit

typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let action = UIAlertAction(title: "ee", style: .default) { _ in
            print("alert!")
        }
        
        let actionHandler = action.value(forKey: "handler")!
        let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(actionHandler as AnyObject).toOpaque())
        let handler = unsafeBitCast(blockPtr, to: AlertHandler.self)
        handler(action)
    }
}
