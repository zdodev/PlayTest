//
//  CollectionViewCell.swift
//  iOSTest
//
//  Created by Zero DotOne on 2021/02/03.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countryNameLabel: UILabel!
    
    func configure(with countryName: String) {
        countryNameLabel.text = countryName
    }
}
