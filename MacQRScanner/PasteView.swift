//
//  MacQRScannerApp.swift
//  MacQRScanner
//
//  Created by Danny on 5/3/26.
//


import SwiftUI
import AppKit

extension NSView {
    func findSubview<T: NSView>(ofType type: T.Type) -> T? {
        if let match = self as? T { return match }
        for sub in subviews {
            if let found = sub.findSubview(ofType: type) { return found }
        }
        return nil
    }
}

struct PasteReceiver: NSViewRepresentable {
    var onPaste: () -> Void

    func makeNSView(context: Context) -> PasteView {
        let view = PasteView()
        view.onPaste = onPaste
        return view
    }

    func updateNSView(_ nsView: PasteView, context: Context) {}
}

class PasteView: NSView {
    var onPaste: (() -> Void)?

    override var acceptsFirstResponder: Bool { true }

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        window?.makeFirstResponder(self)
    }

    @objc func paste(_ sender: Any?) {
        onPaste?()
    }
}
