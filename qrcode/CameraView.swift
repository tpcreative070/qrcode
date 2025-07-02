//
//  CameraView.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 2/7/25.
//

import SwiftUI
import AVFoundation

struct CameraView : UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self,didFishProcessingPhoto: didFishProcessingPhoto)
    }
    
    typealias UIViewControllerType = UIViewController
    
    let cameraService : CameraService
    
    let didFishProcessingPhoto : (Result<AVCapturePhoto,Error>) -> ()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        cameraService.start(delegate: context.coordinator) { err in
            if let err = err {
                didFishProcessingPhoto(.failure(err))
                return
            }
            
            
            
            
        }
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraService.previewLayer)
        cameraService.previewLayer.frame = viewController.view.bounds
        return viewController
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    class Coordinator : NSObject, AVCapturePhotoCaptureDelegate {
        let parent : CameraView
        
        private var didFishProcessingPhoto : (Result<AVCapturePhoto,Error>) -> ()
        
        init(parent: CameraView,didFishProcessingPhoto : @escaping (Result<AVCapturePhoto,Error>) -> ()) {
            self.parent = parent
            self.didFishProcessingPhoto = didFishProcessingPhoto
            
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
            if let error = error {
                didFishProcessingPhoto(.failure(error))
                return
            }
            didFishProcessingPhoto(.success(photo))
            
            
        }
        
        
    }
    
    
}
