//
//  ListViewModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import Foundation


class ListViewModel :NSObject{
    var httpUility : HttpUtility!
    private (set) var listdata: [List]!{
        didSet{
            self.bindListViewToController()
        }
    }
    private(set) var error:Error!{
        didSet{
            self.bindErrorViewModelToController()
        }
    }
    var isSucess = true
    var bindListViewToController: (()->()) = {}
    var bindErrorViewModelToController:(()->()) = {}
    init(httpUility: HttpUtility!){
        self.httpUility = httpUility
    }
    func callFuncToGetProductList(){
        self.httpUility.getResponse(generalType: [List].self, Api: "", method: "GET") { result in
            switch result{
            case .success(let listData):
                self.listdata = listData
            case .failure(let err ):
                self.error = err
            }
        }
    }
    
}
