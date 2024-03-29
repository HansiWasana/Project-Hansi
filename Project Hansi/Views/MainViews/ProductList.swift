//
//  ProductList.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct ProductList: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                HStack{
                    VStack(spacing: 0){
                        HStack{
                            Text("PRODUCTS")
                                .font(Font.custom("Tenor Sans", size: 15))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.vertical) {
                            VStack{
                                ScrollView(.vertical) {
                                    
                                    LazyVGrid(columns: adaptiveColumns) {
                                        ForEach(0..<10, id: \.self) { i in
                                            ProductIteamView(product:Products
                                                .randomElement()!)
                                            
                                        }
                                    }
                                    
                                }
                                .scrollIndicators(.hidden)
                                
                            }.padding([.leading, .trailing], 20)
                            //FooterView()
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top,46)
            }
            
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .top){
                        HeaderView {
                            presentSideMenu.toggle()
                            
                        } cartAction: {
                            presentSideCart.toggle()
                        }
                        
                    }
                    
                    SideMenu()
                    SideCart()
                    
                }
            }
            
    
            
            @ViewBuilder
            private func SideMenu()-> some View {
                SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presenSideMenu: $presentSideMenu)), direction: .leading)
                
            }
            
            @ViewBuilder
            private func SideCart()-> some View {
                SideView(isShowing: $presentSideCart, content:
                            AnyView(SideCartViewContents(presentSideMenu:$presentSideCart)), direction: .trailing)
                
            }
        }
    

struct ProductListView_Previews: PreviewProvider {
            static var previews: some View {
               ProductList()
                    
                }
            }
        

//product list view
