//
//  qrcodeApp.swift
//  qrcode
//
//  Created by Tran Thanh Phong on 1/7/25.
//

import SwiftUI
import IQKeyboardManagerSwift
@main
struct qrcodeApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
}
