//
//  CameraDisplayView.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 2/7/25.
//

import SwiftUI

struct CameraDisplayView : View {
    
    @State private var capturedImage : UIImage?  = nil
    @State private var isCustomCameraViewPrented = false


    
    var body: some View {
        
        if capturedImage !=  nil {
            
            Image(uiImage: capturedImage!)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }else{
            Color(UIColor.systemBackground)
        }
        
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    isCustomCameraViewPrented.toggle()
                },label : {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }).padding(.bottom)
            }
            
        }.sheet(isPresented: $isCustomCameraViewPrented) {
            CustomCameraView(capturedImage: $capturedImage)
        }
    }
}
