//
//  ProductDetailsView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var product:Product
    
   // private let categories = ["All", "Mens", "Womens", "Kids", "Blouse", "Trousers"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView{
        ZStack{
            
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack(spacing: 0) {
                    ScrollView {
                        TabView {
                            ForEach(0..<product.images.count, id: \.self) { i in
                                Image(product.images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 500) // Adjust the height as needed
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Add this line
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Add this line
                        .frame(height: 500) // Adjust the height as needed
                    

                        .padding(.top, 20)
                        //.tabViewStyle(.page)
                       // .indexViewStyle(
                           // .page(backgroundDisplayMode: .always))
                       // .padding([.leading, .trailing], 10)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(product.title)
                                    .font(Font.custom("Tenor Sans", size: 16))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                                Spacer()
                                Image("Export")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20 )
                                
                                Text("$\(product.price)")
                                    .font(Font.custom("Tenor Sans", size: 27))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .trailing], 20)
                            
                            Text("DESCRIPTION")
                                .font(Font.custom("Tenor Sans", size: 16))
                                .foregroundStyle(.black)
                                .padding(.top, 20)
                                .padding([.leading, .trailing], 140)
                            
                            Text("\(product.description)")
                                .font(Font.custom("Tenor Sans", size: 14))
                                .foregroundStyle(.black)
                                .padding(.top, 4)
                                .padding([.leading, .trailing], 20)
                            
                            Text("You may also like")
                                .font(Font.custom("Tenor Sans", size: 14))
                                .foregroundStyle(.black)
                                .padding(.top, 20)
                                .padding([.leading, .trailing], 140)
                            
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(width:  400, height: 0.5)
                            
                            Spacer()
                            
                            VStack{
                                
                                HStack{
                                    ProductIteamView(product: product1)
                                    ProductIteamView(product: product2)
                                    
                                    
                                }
                                HStack{
                                    ProductIteamView(product: product3)
                                    ProductIteamView(product: product4)
                                    
                                }
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding([.leading, .trailing])
                                
                                HStack(alignment: .center, spacing: 18) {
                                    Text("Explore More")
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.black)
                                    
                                    Image(systemName: "arrow.forward")
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(Color.black)
                                }
                                .padding(14)
                                
                            }
                            
                            
                            
                            
                        }
                        
                    }
                    
                    .padding(.top, 56)
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top){
                HeaderView {
                    presentSideMenu.toggle()
                    
                } cartAction: {
                    presentSideCart.toggle()
                }
                
            }
            
               
                    NavigationLink{
                        CheckoutView()
                    }label: {
                        HStack{
                           
                            Text("Add to Basket")
                                .font(Font.custom("Tenor Sans", size: 17))
                                .kerning(0.14)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                            
                            
                            
                        }
                        .padding([.leading, .trailing], 26)
                    }
                    .frame(height: 46)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.black)
                    .padding(.top, 720)
                    
                    SideMenu()
                    SideCart()
                }
                
            
        }
            
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .bottom)
        
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

         

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: product1)
    }
}

