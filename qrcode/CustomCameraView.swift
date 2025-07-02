//
//  Untitled.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 2/7/25.
//
import SwiftUI


struct CustomCameraView : View {
    
    let cameraService  = CameraService()
    @Binding var capturedImage : UIImage?
    
    @Environment(\.presentationMode) private var presentatationMode
    
    var body : some View {
        
        ZStack {
            
            CameraView(cameraService: cameraService) { result in
                switch result {
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation(){
                        capturedImage = UIImage(data: data)
                        presentatationMode.wrappedValue.dismiss()
                        print("Taken photo successfully")
                    }else{
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
            
            VStack {
                Spacer()
                Button {
                    cameraService.capturePhoto()
                    print("Action")
                } label: {
                    Image(systemName: "circle").font(.system(size: 72))
                        .foregroundColor(.white)
                }.padding(.bottom)

            }
        }
    }
}


//#Preview {
//    CustomCameraView(capturedImage: nil, presentatationMode: <#T##arg#>)
//}
