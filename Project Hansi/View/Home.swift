//
//  Home.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-26.
//

import SwiftUI

struct Home: View {
    
    //Category Properties
    @State var selectedCategory="Chico"
    
    @EnvironmentObject var cartManager:CartManager
    //ScrollView{
    var body: some View {
        ScrollView{
            VStack {
                //header
                HStack {
                    Text("Oder from DocksNDazzle")
                        .font(.system(size:32))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70,height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                }
                .padding(30)
                
                Spacer()
                //category list
                
                CatergoryListView
                
                //collection view
                HStack{
                    Text("All Collection")
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                    NavigationLink {
                        CollectionView()
                            .environmentObject(CartManager())
                    }label: {
                        
                        Image(systemName: "arrow.right")
                            .imageScale(.large)
                        
                    }
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                
                // product List
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(productList,id: \.id) { item in
                            ProductCard(product: item)
                        }
                        
                    }
                }
            }
        }
    }

    
        //category list view
        var CatergoryListView:some View{
            HStack {
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack{
                        ForEach(categoryList, id: \.id) { item in
                            Button{
                                selectedCategory = item.title
                            } label: {
                                HStack{
                                    if item.title !=  "All"{
                                        Image(item.icon)
                                            .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                        
                                    }
                                    Text(item.title)
                                }
                                .padding()
                                .background(selectedCategory == item.title ? .black: .gray.opacity(0.1))
                                .foregroundColor(selectedCategory != item.title ? .black: .white)
                                .clipShape(Capsule())
                            }
                        }
                    }
                    .padding(.horizontal,30)
                }
            }
            
        }
    }
    

#Preview {
    Home()
        .environmentObject(CartManager())
}

//product Card View

struct ProductCard:View {
    
    var product:Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.system(size: 30, weight: .semibold))
                    .frame(width: 140)
                
                Text(product.category)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                
            Spacer()

                HStack{
                    Text("$\(product.price).0")
                        .font(.system(size: 24,weight: .semibold))
                    
                    Spacer()
                    
                    Button{cartManager.addToCart(product: product)
                        
                    }label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 90, height: 67)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -10)
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height:80)
                .background(.white.opacity(0.5))
                .clipShape(Capsule())
                
                Spacer()
                
                HStack{
                    
                }
            })
            
        }
        .padding()
        .frame(width: 335, height: 420)
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading,20)
    }
}
