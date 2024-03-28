//
//  ProductIteamView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-27.
//

import SwiftUI

struct ProductIteamView: View {
    
    var product:Product
    
    var body: some View {
        VStack{
            Button{
                
            }label: {
                VStack{
                    Image(product.images[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:  150, height: 200)
                        .cornerRadius(8)
                        .shadow(radius: 1)
                    
                    Text(product.title)
                        .font(Font.custom("Tenor Sans", size: 13))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .frame(width: 165, alignment: .top)
                    
                    
                    Text("$\(product.price)")
                        .font(Font.custom("Tenor Sans", size: 22))
                        .foregroundColor(Color.black)
                        .padding(.top, 2)
                }
            }
            
        }
    }
}


struct ProductIteamView_Previews: PreviewProvider {
    static var previews: some View {
        ProductIteamView(product: product1)
    }
}

