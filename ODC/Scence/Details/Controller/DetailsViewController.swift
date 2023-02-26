//
//  DetailsViewController.swift
//  ODC
//
//  Created by Mohamed Khaled on 19/02/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    // MARK: - Vars
    static let ID = String(describing: DetailsViewController.self)
    var productDetails:FruitsModel?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.hidesBackButton = true
        setUp()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    func setUp() {
        ProductImage.image = UIImage(named: productDetails?.image ?? " ")
        productName.text = productDetails?.name ?? " "
    }
    
    // MARK: - Back Button
    @IBAction func Back(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
