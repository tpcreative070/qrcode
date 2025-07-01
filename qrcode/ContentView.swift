//
//  ContentView.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var name  :String = "Vietnam"
    @StateObject var sample = SampleViewModel()
    var body: some View {
        
        NavigationView {
            VStack {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Button {
                    name = "Go Vietnam"
                    sample.change()
                    
                } label: {
                    Text("Change")
                }.padding(.top, 20)
                
                Text("Hello World \(self.name)").padding(.top,20).foregroundColor(.blue)
                
                TextView(title: self.$name).padding(.top,20)
                
                Text("---> \(sample.name)").padding(.top,20)
                NavigationLink() {
                    SampleDetail()
                }label: {
                    Text("Navigation Link")
                }
            }
        
                .padding()
        }.environmentObject(sample)
    }
}


struct TextView : View {
    
    @Binding var title :String
    var body: some View {
        VStack {
            Text("-> \(self.title)")
        }
    }
}

#Preview {
    ContentView()
}
