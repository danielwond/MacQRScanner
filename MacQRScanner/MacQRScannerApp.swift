//
//  MacQRScannerApp.swift
//  MacQRScanner
//
//  Created by Danny on 5/3/26.
//

import SwiftUI

@main
struct MacQRScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 420, height: 300)
        }
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
    }
}
