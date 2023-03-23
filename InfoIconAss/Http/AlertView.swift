//
//  AlertView.swift
//  InfoIconAss
//
//  Created by APPLE on 22/03/23.
//

import Foundation
import UIKit

extension UIAlertController{
    
    @objc class func showAlertError(message:String,view:UIViewController){
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(defaultAction)
        view.present(alertController, animated: true, completion: nil)
    }
}
