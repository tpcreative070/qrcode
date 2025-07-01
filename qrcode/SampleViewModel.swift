//
//  SampleViewModel.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 1/7/25.
//

import Foundation

class SampleViewModel : ObservableObject{
    
    @Published var name : String = ""
    
    func change() {
        name = "Welcome to SwiftUI"
    }
}
  
