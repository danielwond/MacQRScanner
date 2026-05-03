import SwiftUI
import AppKit

struct ContentView: View {

    @State private var result = "Paste a QR image"
    @State private var isSuccess = false

    private let scanner = MacQRScanner()

    var body: some View {
        ZStack(alignment: .top) {

            LinearGradient(
                colors: [
                    Color.black.opacity(0.9),
                    Color.blue.opacity(0.2)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {

                VStack(spacing: 18) {

                    Image(systemName: isSuccess ? "checkmark.circle.fill" : "qrcode.viewfinder")
                        .font(.system(size: 34))
                        .foregroundStyle(isSuccess ? .green : .white.opacity(0.9))

                    Text(isSuccess ? "Scanned" : "QR Reader")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white.opacity(0.9))

                    ZStack {
                        if isSuccess {
                            Text(result)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                                .textSelection(.enabled)
                                .multilineTextAlignment(.center)
                                .padding()
                        } else {
                            Text("Paste a QR image")
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.06))
                    )

                    if isSuccess {
                        HStack(spacing: 16) {
                            Button("Copy") {
                                NSPasteboard.general.clearContents()
                                NSPasteboard.general.setString(result, forType: .string)
                                restoreFocus()
                            }
                            Button("Clear") {
                                result = "Paste a QR image"
                                isSuccess = false
                                restoreFocus()
                            }
                        }
                        .buttonStyle(.bordered)
                    }

                    PasteReceiver {
                        handlePasteFromClipboard()
                    }
                    .frame(width: 0, height: 0)
                }
                .padding(24)
                .frame(width: 320)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.ultraThinMaterial)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.white.opacity(0.08))
                )
                .shadow(color: .black.opacity(0.35), radius: 25, x: 0, y: 10)
                .padding(.top, 40)

                Spacer()
            }
        }
    }
    
    private func restoreFocus() {
        guard let window = NSApp.keyWindow else { return }
        if let pasteView = window.contentView?.findSubview(ofType: PasteView.self) {
            window.makeFirstResponder(pasteView)
        }
    }
    
    private func handlePasteFromClipboard() {
        let pasteboard = NSPasteboard.general

        guard let image = NSImage(pasteboard: pasteboard),
              let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            result = "No image in clipboard"
            isSuccess = false
            return
        }

        if let value = scanner.detectQRCode(cgImage: cgImage) {
            withAnimation {
                result = value
                isSuccess = true
            }
        } else {
            result = "No QR found"
            isSuccess = false
        }
    }
}
