//
//  ListnewTableViewCell.swift
//  InfoIconAss
//
//  Created by APPLE on 21/03/23.
//
import Kingfisher
import UIKit

protocol cellDelegate: class{
    func cellbtntapped(tag: Int)
}





class ListnewTableViewCell: UITableViewCell {
    
    weak var Delegate: cellDelegate?
    
    @IBOutlet var ProductImage: UIImageView!
    
    @IBOutlet var lblTitle: UILabel!
    
   
    @IBOutlet var lblCategory: UILabel!
    
    
    @IBOutlet var lblDescription: UILabel!
    
    @IBOutlet var lblPrice: UILabel!
    
    @IBOutlet var Detailnext: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    func setUPCell(productList:List){
        
        self.lblTitle.text = "\(productList.title)"
        self.lblPrice.text = "\(productList.price)"
        self.lblDescription.text = "\(productList.description)"
        self.lblCategory.text = "\(productList.category)"
        ProductImage.setImage(with: productList.image)
        
    }
    
    
    @IBAction func Detailsbt(_ sender: UIButton) {
        Delegate?.cellbtntapped(tag: sender.tag)
    }
    
    
}
