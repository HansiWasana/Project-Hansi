//
//  HomeView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-27.
//

import SwiftUI

struct HomeView: View {
    
    private var categories = [Categories.All.rawValue, Categories.Appareal.rawValue, Categories.Dress.rawValue, Categories.TShirt.rawValue, Categories.Bag.rawValue]
    
    @State private var selectedCatergory: Int = 0
    
    var body: some View {
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
                        
                        //Spacer()
                        
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                }
                .padding(.top, 56)
                
            }
            .frame(maxWidth:  .infinity, maxHeight: .infinity)
            .overlay(alignment: .top)
            {
                
                
            }
        }
    }
    
    @ViewBuilder
    private func HeroImageView()-> some View {
        ZStack{
            Image("Hero")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 420)
            
            Button{
                print("Explore Collection Button Clicked")
                
            }label: {
                RoundedRectangle(cornerRadius: 30).overlay{
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
    
    
    @ViewBuilder
    private func NewArrivalView()-> some View {
        Text("New Arrival")
            .font(Font.custom("Tenor Sans", size: 27))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 5)
            
        VStack{
            HStack(spacing: 20) {
                ForEach(0..<categories.count, id: \.self) { i in
                    CategoryView(isSelected: i == selectedCatergory, title: categories[i])
                        .onTapGesture {
                            selectedCatergory = i
                        }
                    
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack{
                ProductIteamView(product: product1)
                ProductIteamView(product: product2)
            }
            
            HStack{
                ProductIteamView(product: product3)
                ProductIteamView(product: product4)
            }
            
            Button{
                
            }label: {
                HStack(
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 18) {
                        Text("Explore More")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                           // .font(tenorsans(10))
                        
                        Image(systemName: "arrow.forward")
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.black)
                }
                                
            }
            .tint(Color.BodyGrey)
            .padding(18)
        }
        
        
    }
    
    @ViewBuilder
    private func CollectionView()-> some View {
         Text("C o l l e t i o n s")
            .font(Font.custom("Tenor Sans", size: 20))
            .foregroundColor(Color.black)
            
        Image("Collections 1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:  150, height: 200)
            .cornerRadius(8)
            .shadow(radius: 1)
            .clipped()
        
        
        
        Image("Collections 2")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:  150, height: 200)
            .cornerRadius(8)
            .shadow(radius: 1)
            .clipped()
        
        
        
        
    }
    
    @ViewBuilder
    private func SideMenu()-> some View {
        
    }
    
    @ViewBuilder
    private func SideCart()-> some View {
        
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}

