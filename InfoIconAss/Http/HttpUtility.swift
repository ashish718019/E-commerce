//
//  HttpUtility.swift
//  InfoIconAss
//
//  Created by APPLE on 22/03/23.
//

import Foundation


class HttpUtility{
    
    func getResponse<T:Decodable>(generalType: T.Type,Api:String? = "",method:String,dict:[String:Any]? = nil,completion:@escaping(Result<T,Error>) -> Void){
        
        let url = URL(string: Constant.baseURL + (Api ?? ""))!
        var request = URLRequest(url: url)
        if method == "GET"{
          request.httpMethod = "GET"
            
        }else{
            request.httpMethod = "POST"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: dict ?? ["":""], options: []) else {
                   return
               }
            request.httpBody = httpBody
            
            }
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if error == nil{
                if let data = data{
                    do{
                        let string =   try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        print(string)
                        let response = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    }catch{
                        completion(.failure(error))
                    }
                }else{
                    if let err = error{
                        completion(.failure(err))
                    }else{
                        completion(.failure("error" as! Error))
                    }
                }
            }else{
                completion(.failure(error!))
            }
        }.resume()
        
        
    }
}
