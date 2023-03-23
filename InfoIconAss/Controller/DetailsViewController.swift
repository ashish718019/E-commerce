//
//  DetailsViewController.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet var lblProductTitle: UILabel!
    @IBOutlet var lblCategory: UILabel!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblRate: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var buyBtn: UIButton!
    
    
    var listValues:[DetailsModel] = []
    var index:Int = 1000
    var viewModel:DetailsViewModel!
    var productID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData()
        setUI()
        
    }
    
    func GetData(){
        let httpUtility = HttpUtility()
        viewModel = DetailsViewModel(httpUility: httpUtility)
        viewModel.callData(productID: productID)
        viewModel.bindViewModelToContoller = {
            DispatchQueue.main.async {
                guard let details =  self.viewModel.detailsdata else{
                    return
                }
                self.lblProductTitle.text = "\(details.title)"
                self.lblPrice.text = "\(details.price)"
                self.lblDescription.text = "\(details.description)"
                self.lblCategory.text = "\(details.category)"
                self.productImage.setImage(with: details.image)
                self.lblRate.text = "\(details.rating)"
                    
                
            }
            
        }

    }
    
    func setUI(){
        addBtn.layer.cornerRadius = 10
        buyBtn.layer.cornerRadius = 10
        
    }
}
