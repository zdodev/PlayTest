import UIKit

class ViewController: UIViewController {
    let activityIndicator: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .large)
    }()
    
    let uiView = {
        UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(activityIndicator)
//        activityIndicator.frame = CGRect(x: 50, y: 50, width: 20, height: 20)
//        view.addSubview(uiView)
    }
    
    override func viewDidLayoutSubviews() {
//        uiView.frame = CGRect(x: , y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        uiView.frame = view.bounds
        uiView.backgroundColor = .systemRed
        let window = UIApplication.shared.windows[0]
//        print(window.safeAreaInsets.)
//        let uiedge = UIEdgeInsets()
        print(uiView.frame)
        print(uiView.bounds)
    }
}

