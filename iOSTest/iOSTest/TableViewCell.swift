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
    
    let previewTextLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(dateTextLabel)
        contentView.addSubview(previewTextLabel)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        titleTextLabel.frame = CGRect(x: 8, y: 8, width: contentView.frame.width, height: 20)
        
        dateTextLabel.frame = CGRect(x: 8, y: titleTextLabel.frame.height + 8, width: 150, height: 20)
        
        previewTextLabel.frame = CGRect(x: dateTextLabel.frame.width + 10, y: dateTextLabel.frame.origin.y, width: contentView.frame.width - dateTextLabel.frame.width, height: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleTextLabel.text = nil
        dateTextLabel.text = nil
        previewTextLabel.text = nil
    }
    
    func configure(with model: MemoItem) {
        titleTextLabel.text = model.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.autoupdatingCurrent
        let dateTime = Date(timeIntervalSince1970: TimeInterval(model.lastModified))
        dateTextLabel.text = dateFormatter.string(from: dateTime)
        
        previewTextLabel.text = model.body
    }
}
