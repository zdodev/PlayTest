//
//  CollectionViewController.swift
//  iOSTest
//
//  Created by Zero DotOne on 2021/02/03.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    let dataSource: [String] = ["USA", "Brazil", "China", "United Kingdom", "Korea ", "Mexico", "India"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("😎 collectionView: \(collectionView)\n section: \(section)")
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("🥸 collectionView: \(collectionView)\n indexPath: \(indexPath)")
        var cell = UICollectionViewCell()
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            countryCell.configure(with: dataSource[indexPath.row])
            cell = countryCell
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView: \(collectionView)\n indexPatn: \(indexPath)")
        print("Selected Country: \(dataSource[indexPath.row])")
    }
}
