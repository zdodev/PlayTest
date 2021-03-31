import UIKit
import Network

final class ViewController: UIViewController {
    
    private let greenView = UIView()
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView() {
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: greenView.bottomAnchor, multiplier: 1.0)
        ])
    }
}
