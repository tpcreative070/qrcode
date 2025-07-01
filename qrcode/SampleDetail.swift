//
//  SampleDetail.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 1/7/25.
//

import SwiftUI
import SwiftData
struct SampleDetail : View{
    @EnvironmentObject var sample : SampleViewModel
    @State private var name: String = "Tim"

    var body : some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Hello \(sample.name)")
            
            TextField("Enter your name", text: $name).padding(.all,20 )
                 Text("Hello, \(name)!")
        }
    }

}


#Preview {
    SampleDetail()
}

