//
//  CollectionView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-26.
//

import SwiftUI

struct CollectionView: View{
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body:some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack{
                        
                        Text("order from the docks n dazzle")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height:90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                }
            }
        }
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}
//small product card

struct smallProductCard :View{


    var product :Product

    var body:some View{
          ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))

                ZStack {
                    VStack(alignment: .leading, content: {
                        Text("\(product.name)")
                           .font(.system(size: 18, weight: .semibold))
                           .frame(width: 200)

                           Text(product.category)
                            .font(.system(size: 10))
                            .padding()
                            .background(.white)
                            .clipShape(Capsule())
                            
                           Spacer()
                            
                            HStack{
                                Text("$\(product.price).0")
                                   .font(.system(size: 14,weight: .semibold))

                                  Spacer()

                                  Button {

                                  }label: {
                                    Image(systemName: "basket")
                                        .imageScale(.large)
                                        .frame(width:45, height:40)
                                        .background(.black)
                                        .clipShape(Capsule())

                                  }
                            }

                            .padding(.trailing, -12)
                            .padding()
                          //  .frame(maxwidth: .infinity)
                            .frame(height: 45)
                            .background(.white.opacity(0.9))
                            .clipShape(Capsule())
                    })
                }
                .padding(120)
                .frame(width: 170, height: 215)
          }
          .frame(width: 170, height: 215)
          .background(product.color.opacity(0.13))
          .clipShape(.rect(cornerRadius: 30))
          .padding(.leading, 10)
    }
}
