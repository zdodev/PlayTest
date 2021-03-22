import UIKit
import Network

final class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monitor.pathUpdateHandler = { path in
            print(path.status)
        }
        
        let queue = DispatchQueue.global(qos: .background)
        monitor.start(queue: queue)
    }
}
