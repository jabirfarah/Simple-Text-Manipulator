//
//  ContentView.swift
//  TextEdit2
//
//  Created by Jabir Farah on 2022-04-11.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var capIndex = 0
    var body: some View {
        
        VStack {
            Spacer()
            if capIndex == 1 {
                Text(userText.uppercased())
                    .font(.largeTitle)
                
            } else if capIndex == 2 {
                Text(userText.capitalized)
                    .font(.largeTitle)
                
            } else {
                Text(userText.lowercased())
                    .font(.largeTitle)
            }
            
            Spacer()
            Button(action:{
                if capIndex == 1 {
                    UIPasteboard.general.string = userText.uppercased()
                        
                } else if capIndex == 2 {
                    UIPasteboard.general.string = userText.capitalized
                    
                } else {
                    UIPasteboard.general.string = userText.lowercased()
                }

            }) {
                RoundedButton(title: "Copy text", color: .gray)
            }
            
            HStack {
                Button(action:{
                    capIndex = 1
                }) {
                    RoundedButton(title: "CAPS", color: .blue)
                }
                Button(action:{
                    capIndex = 2
                }) {
                    RoundedButton(title: "First Letter", color: .green)
                }
                Button(action:{
                    capIndex = 3
                }) {
                    RoundedButton(title: "lowercase", color: .red)
                }
            }
            TextField("Enter Text Here...", text: $userText)
                .padding()
        }
        .padding()
    }
    
    struct RoundedButton: View {
        
        var title: String
        var color: Color
        
        var body: some View {
            Text(title)
                .frame(maxWidth:.infinity)
                .padding(10)
                .background(color)
                .font(.body)
                .foregroundColor(.white)
                .cornerRadius(10)
            
        }
        
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
