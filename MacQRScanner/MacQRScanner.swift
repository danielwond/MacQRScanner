//
//  MacQRScannerApp.swift
//  MacQRScanner
//
//  Created by Danny on 5/3/26.
//

import Cocoa
import Vision

class MacQRScanner {

    func detectQRCode(cgImage: CGImage) -> String? {
        let request = VNDetectBarcodesRequest()
        request.symbologies = [.qr]

        let handler = VNImageRequestHandler(
            cgImage: cgImage,
            orientation: .up,
            options: [:]
        )

        do {
            try handler.perform([request])
        } catch {
            print("Vision error:", error)
            return nil
        }

        guard let results = request.results as? [VNBarcodeObservation],
              let first = results.first else {
            print("No QR detected")
            return nil
        }

        return first.payloadStringValue
    }
}
