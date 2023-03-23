//
//  ListModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//

import Foundation

// MARK: - WelcomeElement

//typealias ListModel = [List]
struct ListModel:Codable{
    var list:[List]
}

struct List: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: RatingList
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct RatingList: Codable {
    let rate: Double
    let count: Int
}



