//
//  HomeView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-27.
//

import SwiftUI

struct HomeView: View {
    
    //Categories.All.rawValue,
    
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    private let categories = ["All", "Mens", "Womens", "Kids", "Tops", "Shorts"]
    

    @State private var selectedIndex: Int = 0
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                ZStack{
                    VStack(spacing: 0) {
                        ScrollView (.vertical){
                            HeroImageView()
                            NewArrivalView()
                            Image("Brand")
                                .resizable()
                                .frame(height:  145, alignment: .top)
                                .aspectRatio(contentMode: .fit)
                            CollectionView()
                            //FooterView()
                        }
                        .padding(.top, 56)
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
            .navigationBarHidden(true)
        }
     
        
    }
    
    @ViewBuilder
    private func HeroImageView() -> some View {
        
        NavigationLink{
            ProductList()
        } label: {
            ZStack {
                Image("Hero")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 420)
                
                Button(action: {
                    print("Explore Collection Button Clicked")
                }) {
                    RoundedRectangle(cornerRadius: 30)
                        .overlay {
                            Text("Explore Collection")
                                .font(Font.custom("Tenor Sans", size: 15))
                                .foregroundColor(.white)
                        }
                }
                .frame(width: 253, height: 40)
                .tint(.black.opacity(0.4))
                .offset(.init(width: 0, height: 130))
            }
        }
        
    }
    
    @ViewBuilder
    private func NewArrivalView() -> some View {
        Text("New Arrival")
            .font(Font.custom("Tenor Sans", size: 23))
            .multilineTextAlignment(.center)
            .kerning(4)
            .foregroundColor(.black)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 5)
        
        Rectangle()
            .foregroundColor(Color.gray)
            .frame(width:  300, height: 1)
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< categories.count) { i in
                    CategoryView(isSelected: i == selectedIndex, text: categories[i])
                        .onTapGesture {
                            selectedIndex = i
                            //navigate(selectedIndex: i)
                        }
                }
            }
            .padding()
        }
        
        HStack {
            ProductIteamView(product: product1)
            ProductIteamView(product: product2)
        }
        
        HStack {
            ProductIteamView(product: product3)
            ProductIteamView(product: product4)
        }
        
        Button(action: {
            // Explore more action
        }) {
            //            HStack(alignment: .center, spacing: 18) {
            //
            //                Text("Explore More")
            //                    .multilineTextAlignment(.center)
            //                    .foregroundColor(Color.black)
            //
            //                Image(systemName: "arrow.forward")
            //                    .frame(width: 18, height: 18)
            //                    .foregroundColor(Color.black)
            //            }
            
            NavigationLink {
                ProductList()
            }label: {
                HStack {
                    Text("Navigate to Product List")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                    
                    Image(systemName: "arrow.forward")
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.black)
                }            }
                
            }

        
        .tint(Color.BodyGrey)
        .padding(18)
    }
    
    @ViewBuilder
    private func CollectionView() -> some View {
        Text("C o l e c t i o n s")
            .font(Font.custom("Tenor Sans", size: 20))
            .foregroundColor(Color.black)
        
        NavigationLink{
            ProductList()
        }label: {
            Image("Collections 4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 200)
                .cornerRadius(8)
                .shadow(radius: 1)
                .clipped()
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}

struct CategoryView: View {
    let isSelected: Bool
    let text: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(Color(.black))
            
            if isSelected {
                Color("logoTextColor")
                    .frame(width: 17, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}
