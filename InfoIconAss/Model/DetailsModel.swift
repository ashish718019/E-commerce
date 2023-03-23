//
//  DetailsModel.swift
//  InfoIconAss
//
//  Created by APPLE on 20/03/23.
//


import Foundation

// MARK: - Welcome
struct DetailsModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

