//
//  CartView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-26.
//

import SwiftUI


struct CartView: View{
    
    @EnvironmentObject var cartManager:CartManager

    @Environment(\.presentationMode) var mode

    var body:some View {
       NavigationView{
        ScrollView{
            VStack {
                HStack{
                    
                    Text("Cart")
                    .font(.system(size: 30))
                    .padding(.trailing)

                    Spacer()

                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                     Text("3")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70, height:90)
                    .background(.yellow.opacity(0.5))
                    .clipShape(Capsule())
                    }
                    .foregroundColor(.black)

                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70, height:90)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    //.background(.yellow.opacity(0.4))
                    //.clipShape(Capsule())
                    }
                    .foregroundColor(.black)
                }
                .padding(23)

                //cart products
                VStack (spacing: 15){
                ForEach(productList) { item in
                      CartProductCard(product: item)
                  }
                }
                 .padding(.horizontal)

                 //card total
                 VStack(alignment: .leading){
                      HStack{
                        Text("Delivery amount")
                        Spacer()
                        Text("$4.00")
                           .font(.system(size: 20, weight: .semibold))
                      }

                      Divider()

                      Text("Total Amount")
                          .font(.system(size: 14))

                      Text("USD 38.00")
                          .font(.system(size: 20,weight: .semibold))
                 }

                .padding(30)
                .frame(maxWidth: .infinity)
                .background(.yellow.opacity(0.5))
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
                .clipShape(Capsule())
                .padding()
                //Total Amount

                //Button to make payment
            }
        }
       }
    }
}

#Preview{
    CartView()
        .environmentObject(CartManager())
}

//cart product view

struct CartProductCard:View{
     
     var product: Product

     var body:some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width:90, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())

                VStack(alignment: .leading, content: {
                     Text("\(product.name)")
                       .font(.headline)
                })

                Spacer()

                Text("$\(product.price)")
                   .padding()
                   .background(.yellow.opacity(0.5))
                   .clipShape(Capsule())
        }
     }
}
