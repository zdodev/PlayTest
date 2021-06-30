import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        page += 1
        
        if page == 3 {
            page = 0
        }
        
        pageControl.currentPage = page
    }
}
