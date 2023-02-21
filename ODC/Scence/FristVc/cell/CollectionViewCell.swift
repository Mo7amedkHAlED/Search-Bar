//
//  CollectionViewCell.swift
//  ODC
//
//  Created by Mohamed Khaled on 18/02/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let ID = String(describing: CollectionViewCell.self)
    @IBOutlet weak var productNumber: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
