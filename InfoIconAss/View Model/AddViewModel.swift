//
//  AddViewModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import Foundation
class AddViewModel :NSObject{
    var httpUility : HttpUtility!
   var response:Bool!{
        didSet{
            self.bindViewModelToContoller()
        }
    }
   
    var bindViewModelToContoller:(()->()) = {}
    
    init(httpUility: HttpUtility!){
        self.httpUility = httpUility
    }
    func addPRoduct(detailProduct:[String:Any]){
        
       self.httpUility.getResponse(generalType: AddProductModel.self, method: "POST",dict: detailProduct) { result in
           switch result{
           case .success(_):
               self.response = true
           case .failure(_):
               self.response = false
           }
       }
    }
}
