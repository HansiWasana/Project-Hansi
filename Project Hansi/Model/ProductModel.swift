//
//  ProductModel.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-26.
//
import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category:String
    var image: String
    var color:Color
    var price:Int
}

//sample product

var productList = [
    Product(name: "Ladies", category: "Ladies Tops", image: "", color:.yellow, price: 8),
    Product(name: "Men", category: "Ladies Bottoms", image: "", color:.red, price: 8),
    Product(name: "Babies", category: "Ladies Dresses", image: "", color:.red, price: 8),
    Product(name: "Beach Essensial", category: "Ladies Coats", image: "", color:.red, price: 8),
    Product(name: "Product name 5", category: "Beach Essentials", image: "", color:.red, price: 8),
    
                                      
]
