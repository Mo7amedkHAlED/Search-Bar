//
//  ViewController.swift
//  ODC
//
//  Created by Mohamed Khaled on 18/02/2023.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var image  = [UIImage(named: "icon-11"),UIImage(named: "icon-22"),UIImage(named: "icon-33"),UIImage(named: "icon-44"),UIImage(named: "icon-55"),UIImage(named: "icon-66")]
    var names = ["New Arrivls","Clothes","Bags","Shoses","Electronics","Jewelry"]
    var number = [208,358,160,230,130,87]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: CollectionViewCell.ID, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.ID)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:CollectionViewCell.ID , for: indexPath) as! CollectionViewCell
        cell.cellImage.image = image[indexPath.row]
        cell.productName.text = names[indexPath.row]
        cell.productNumber.text = " \(number[indexPath.row])Products"
        cell.layer.cornerRadius = cell.bounds.height/2
        return cell
    }
}

