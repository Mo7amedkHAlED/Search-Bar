//
//  FruitsCollectionViewCell.swift
//  ODC
//
//  Created by Mohamed Khaled on 19/02/2023.
//

import UIKit

class FruitsCollectionViewCell: UICollectionViewCell {
    // MARK: - Vars
    static let ID = String(describing: FruitsCollectionViewCell.self)
    // MARK: - @IBOutlet
    @IBOutlet weak var fruitsImage: UIImageView!
    @IBOutlet weak var fruitsView: UIView!
    @IBOutlet weak var fruitsName: UILabel!
    
    // MARK: - set Up Cell
    func setUp (_ fruits: FruitsModel) {
        fruitsImage.image = UIImage(named: fruits.image ?? " ")
        fruitsName.text = fruits.name
        fruitsView.backgroundColor = UIColor(named: fruits.color ?? " ")
    }
}
