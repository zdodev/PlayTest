import UIKit

class TableViewCell: UITableViewCell {
    let titleTextLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    
    let dateTextLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    
    let summaryTextLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(dateTextLabel)
        contentView.addSubview(summaryTextLabel)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        titleTextLabel.frame = CGRect(x: 8, y: 8, width: contentView.frame.width, height: 20)
        titleTextLabel.text = "Title, Title, Title, Title, Title, Title, Title, Title, Title, Title, Title, Title, "
        
        dateTextLabel.frame = CGRect(x: 8, y: titleTextLabel.frame.height + 8, width: 150, height: 20)
        dateTextLabel.text = "ABCD"
        
        summaryTextLabel.frame = CGRect(x: dateTextLabel.frame.width + 10, y: dateTextLabel.frame.origin.y, width: contentView.frame.width - dateTextLabel.frame.width, height: 20)
        summaryTextLabel.text = "summary, summary, summary, "
    }
}
