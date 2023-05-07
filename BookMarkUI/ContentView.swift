//
//  WelcomePage.swift
//  lecture-04
//
//  Created by Dimash Nsanbaev on 4/4/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            whoole
            //                .navigationTitle("")
                .navigationBarBackButtonHidden(true)
            
        }
        .accentColor(.black)
        
    }
    
    var whoole:some View{
        VStack{
            Image("bgre")
                .resizable()
                .frame(width: 420,height: 600)
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            VStack{
                Text("Save all interesting links in one app")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: 358.0, height: 92.0,alignment: .leading)
                Spacer()
                Button(action: {}) {
                    NavigationLink(destination: SecondPage()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .frame(width: 358,height: 58)
                            Text("Let’s start collecting")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                    }
                    
                }
                Spacer()
                
            }
        }
        .background(Color.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
