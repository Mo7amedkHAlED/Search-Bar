//
//  FruitsViewController.swift
//  ODC
//
//  Created by Mohamed Khaled on 19/02/2023.
//

import UIKit

class FruitsViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var fruitsCollectionView: UICollectionView!
    
    // MARK: - Vars
    var searchActive:Bool = false
    var fillteredData:[FruitsModel] = []
    var fruits: [FruitsModel] = []
    let searchController = UISearchController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchControllerSetup()
        loadData()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    // MARK: - Search Controller SetUp
    func searchControllerSetup() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
    }
    // MARK: - Get Data
    func loadData() {
        fruits = [ FruitsModel(boarderColor: "Color 1",color: "Color1",name: "Frash Fruits & Vegetable",image: "Image")
                  ,FruitsModel(boarderColor: "Color 2",color: "Color2",name: "Cooking Oil  &  Ghee",image: "Image 1")
                  ,FruitsModel(boarderColor: "Color 3",color: "Color3",name: "Meat & Fish",image: "Image 2")
                  ,FruitsModel(boarderColor: "Color 4",color: "Color4",name: "Bakery & Snacks",image: "Image 3")
                  ,FruitsModel(boarderColor: "Color 5",color: "Color5",name: "Dairy & Eggs",image: "Image 4")
                  ,FruitsModel(boarderColor: "Color 6",color: "Color6",name: "Beverages",image: "Image 5")
                  ,FruitsModel(boarderColor: "Color 7",color: "Color7",name: "Frash Fruits & Vegetable",image: "Image")
                  ,FruitsModel(boarderColor: "Color 8",color: "Color8",name: "Frash Fruits & Vegetable",image: "Image")
        ]
    }
    // MARK: - Register Cell NIB
    func registerCell() {
        fruitsCollectionView.register(UINib(nibName: FruitsCollectionViewCell.ID, bundle: nil), forCellWithReuseIdentifier: FruitsCollectionViewCell.ID)
    }
}
// MARK: - extension implement CollectionView Delegate & DataSource

extension FruitsViewController: collectionViewType {
    // MARK: - number Of Items In Section Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
           return fillteredData.count
        } else {
           return fruits.count
        }
    }
    // MARK: - cell For Item At Method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitsCollectionViewCell.ID, for: indexPath) as! FruitsCollectionViewCell
        if searchActive {
            cell.setUp(fillteredData[indexPath.row])
            cellColor(cell, array: fillteredData[indexPath.row])
            return cell
        } else {
            cell.setUp(fruits[indexPath.row])
            cellColor(cell, array: fruits[indexPath.row])
            return cell
        }
    }
    // MARK: -  Cell color for view & border
    func cellColor(_ cell : UICollectionViewCell, array: FruitsModel ) {
        cell.layer.cornerRadius = 18
        cell.layer.borderColor = UIColor(named: array.boarderColor ?? " ")?.cgColor
        cell.layer.borderWidth = 1
    }
    // MARK: - did Select Item At Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: DetailsViewController.ID) as! DetailsViewController
        if searchActive {
            vc.productDetails = fillteredData[indexPath.row]
        } else {
            vc.productDetails = fruits[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Methods For layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2 ) - 10, height: 189.11)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

// MARK: -  extension implement search methods
extension FruitsViewController : searchControllerType  {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end")
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("canceled")
        searchActive = false
     
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.isEmpty {
            fillteredData = fruits
            fruitsCollectionView.reloadData()
        } else {
            for _ in fruits {
                fillteredData = fruits.filter({ item in
                    return (item.name?.localizedStandardContains(text))!
                })
            }
            fruitsCollectionView.reloadData()
        }
    }
    
}
