
//
//  Untitled.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 1/7/25.
//

import SwiftUI


struct TexFieldView : View{
    @State var fName : String = ""
    @State var lName : String = ""
    var body: some View{
        
        
        VStack(spacing: 50) {
            InfoField(title: "First Name", text: $fName)
            InfoField(title: "Last Name", text: $lName)
        }
        
    }
    
}




struct InfoField : View {
    let title : String
    @Binding var text: String
    @FocusState var isTyping : Bool
    
    
    var body : some View {
        VStack {
            
            ZStack(alignment: .leading) {
                TextField("", text: $text).padding(.leading).frame(height: 55).focused($isTyping)
                    .background(isTyping ? .blue : Color.primary, in: RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
                Text(title).padding(.horizontal,5)
                    .background(.fTitle.opacity(isTyping || !text.isEmpty ? 1 : 0))
                    .foregroundStyle(isTyping ? .blue : Color.primary)
                    .padding(.leading).offset(y : isTyping || !text.isEmpty ? -27 : 0)
                    .onTapGesture {
                        isTyping.toggle()
                    }
            }
            .animation(.linear(duration: 0.2),value: isTyping)
        }
    }
    
    
}


#Preview{
    TexFieldView()
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
