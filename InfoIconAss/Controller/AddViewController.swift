//
//  AddViewController.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import UIKit

class AddViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet var addBtn: UIButton!
    var imagePicker = UIImagePickerController()
    @IBOutlet var selectImage: UIImageView!
    @IBOutlet var selectImageBtn: UIButton!
    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var priceText: UITextField!
    @IBOutlet var descriptionText: UITextField!
    @IBOutlet var categoryText: UITextField!
    var viewModel:AddViewModel!
    var imageURL:URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func GetData(){
    
        guard let title = titleText.text, title != "" else{
            UIAlertController.showAlertError(
                message: "Please enter the title", view: self)
            return
        }
        
        guard let price = priceText.text, price != "" else{
            UIAlertController.showAlertError(
                message: "Please enter the price", view: self)
            return
        }
        guard let description = descriptionText.text, description != "" else{
            UIAlertController.showAlertError(
                message: "Please enter the description", view: self)
            return
        }
        guard let category = categoryText.text, category != "" else{
            UIAlertController.showAlertError(
                message: "Please enter the category", view: self)
            return
        }
        guard let imgURL = imageURL, category != "" else{
            UIAlertController.showAlertError(
                message: "Please enter the category", view: self)
            return
        }
        
        LoaderFile().loaderView(view: self)
        let httpUility = HttpUtility()
        viewModel = AddViewModel(httpUility: httpUility)
        let product = ["title":title,"price":price,"description":description ,"image":imgURL,"category":category] as [String : Any]
        viewModel.addPRoduct(detailProduct: product)
        
        viewModel.bindViewModelToContoller = {
            LoaderFile().stopLoader(view: self)
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
            
            print("Add sucess")
        }
        
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        GetData()
    }
    
    @IBAction func slectbtn(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        selectImage.image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedurl = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            imageURL = pickedurl
        }
           if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // viewModel.profileData[index].profileImage =  (pickedImage.jpegData(compressionQuality: 0.01))!
               selectImage.image = pickedImage //(pickedImage.jpegData(compressionQuality: 0.01))!
               
           }
        dismiss(animated: true, completion: nil)
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion: nil)
       }
    func setUI(){
        addBtn.layer.cornerRadius = 10
    }
}
