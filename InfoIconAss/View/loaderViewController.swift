//
//  loaderViewController.swift
//  InfoIconAss
//
//  Created by APPLE on 22/03/23.
//

import UIKit

class LoaderFile {


    func loaderView(view:UIViewController) {
                let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
                let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
                loadingIndicator.hidesWhenStopped = true
                loadingIndicator.style = UIActivityIndicatorView.Style.large
                loadingIndicator.startAnimating()
                alert.view.addSubview(loadingIndicator)
                //present(alert, animated: true, completion: nil)
              view.present(alert, animated: true)
     
        
            }
            
            func stopLoader(view:UIViewController) {
                DispatchQueue.main.async {
                    view.dismiss(animated: true)
                    
                }
            }
    

  
    

}
