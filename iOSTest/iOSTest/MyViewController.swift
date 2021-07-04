import UIKit

class MyViewController: UIViewController {
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mySwitch.isOn = UserDefaults.standard.bool(forKey: "switch")
    }
    
    @IBAction func pressSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set(mySwitch.isOn, forKey: "switch")
    }
}
