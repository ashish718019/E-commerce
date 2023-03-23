//
//  DetailsViewModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import Foundation
class DetailsViewModel:NSObject{
    var httpUility : HttpUtility!
   var detailsdata:DetailsModel!{
        didSet{
            self.bindViewModelToContoller()
        }
    }
    var bindViewModelToContoller:(()->()) = {}
    init(httpUility: HttpUtility!){
        self.httpUility = httpUility
    }
    
    func callData(productID:String){
        
        
       self.httpUility.getResponse(generalType: DetailsModel.self,Api:"/" + productID , method: "GET") { result in
           switch result{
           case .success(let detail):
               self.detailsdata = detail
           case .failure(let err):
               print(err.localizedDescription)
           }
       }
    }
}
