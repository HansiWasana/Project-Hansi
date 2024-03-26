//
//  CategoryModel.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-26.
//

import SwiftUI

struct CategoryModel:Identifiable, Hashable {
    var id: UUID = .init()
    var icon:String
    var title: String
}
var categoryList:[CategoryModel] = [
    CategoryModel(icon: "", title: "Ladies"),
    CategoryModel(icon: "choco", title: "Mens"),
    CategoryModel(icon: "djk", title: "Childrens"),
    CategoryModel(icon: "gsjhcfjsh", title: "Outlet"),
    CategoryModel(icon: "gsjhcfjsh", title: "Beach Essentials"),
]
