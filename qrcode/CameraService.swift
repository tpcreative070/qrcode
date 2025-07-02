//
//  Untitled.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 2/7/25.
//

import Foundation
import AVFoundation

class CameraService {
    
    var session : AVCaptureSession?
    var delegate : AVCapturePhotoCaptureDelegate?
    var output = AVCapturePhotoOutput()
    
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    func start(delegate : AVCapturePhotoCaptureDelegate, completion : @escaping (Error?) ->()){
        self.delegate = delegate
        checkPermissions(completion: completion)

    }
    
    private func checkPermissions(completion : @escaping (Error?) -> ()) {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
            case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                guard granted else {return}
                DispatchQueue.main.async {
                    self.setupCamera(completion: completion)
                }
            }
                break
            case .restricted:
                break
            case .denied:
                break
            case .authorized:
                self.setupCamera(completion: completion)
                break
            @unknown default:
               break
            
        }
         
    }
    
    
    private func setupCamera(completion : @escaping (Error?) ->()){
        let session  = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video){
            do {
                
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                
                //Multiple views need to reset output
                if !session.canAddOutput(output) {
                    session.removeOutput(output)

                    output = AVCapturePhotoOutput()
                }
                
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                session.startRunning()
                self.session = session
                
            }catch {
                completion(error)
            }
        }
    }
    
    func capturePhoto(with settings : AVCapturePhotoSettings = AVCapturePhotoSettings()){
        
        output.capturePhoto(with: settings, delegate: delegate!)
        
        
    }
    
    
    
}
