//
//  AddModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

struct AddProductModel: Codable {
    let id: Int
    let title, price, description: String
    let image: String
    let category: String
}
