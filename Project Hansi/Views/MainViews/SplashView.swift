//
//  SplashView.swift
//  Project Hansi
//
//  Created by NIBMPC04PC03 on 2024-03-29.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationLink(destination: HomeView()) {
                        Text("go to")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                    
                    Image("splashview")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(width: 200, height: 800)
                }
            }
            .navigationBarHidden(true) // Hide navigation bar if you don't need it
        }
    }
}



struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
