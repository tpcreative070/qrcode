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
    @State var fName : String = ""
    @State var lName : String = ""
    @FocusState private var isFocused: Bool

    
    var body: some View{
        
        
        VStack(spacing: 50) {
            InfoField(title: "First Name", text: $fName).focused($isFocused)
            InfoField(title: "Last Name", text: $lName).focused($isFocused)
            
        }.padding(40)
           
           
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              )
    
    }
      
    
}


#Preview {
    SampleDetail()
}

