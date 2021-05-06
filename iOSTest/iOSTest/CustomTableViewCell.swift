import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var myLabel: UILabel!
    
    static let cellIdentifier = "CustomTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    func configure(with viewModel: CellViewModel) {
        myLabel.text = "\(viewModel.firstName) \(viewModel.lastName)"
    }
}
