//
//  ProductDataModel.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import Foundation

struct Products: Identifiable{
    let id = UUID()
    let name: String
    let image: String
    let price: String
    let description: String
    let color: [Colors]
}

struct Colors: Codable {
    let color: Double
}
