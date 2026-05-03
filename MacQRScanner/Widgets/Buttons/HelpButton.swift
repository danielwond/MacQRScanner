//
//  HelpButton.swift
//  MacQRScanner
//
//  Created by Danny on 5/3/26.
//

import SwiftUI

struct HelpButton: View {
    @State private var showPopover = false

    var body: some View {
        Button {
            showPopover.toggle()
        } label: {
            Text("Help")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.white.opacity(0.7))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Capsule().fill(Color.white.opacity(0.1)))
        }
        .buttonStyle(.plain)
        .popover(isPresented: $showPopover, arrowEdge: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text("How to use")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.primary)

                VStack(alignment: .leading, spacing: 6) {
                    Label("Take a screenshot  CMD + Shift + 4", systemImage: "1.circle.fill")
                    Label("Select the region with the QR code", systemImage: "2.circle.fill")
                    Label("CMD + C to take a screenshot to the clipboard", systemImage: "3.circle.fill")
                    Label("Paste into the app  CMD + V", systemImage: "4.circle.fill")
                }
                .font(.system(size: 12))
                .foregroundColor(.secondary)
            }
            .padding(16)
            .frame(width: 260)
        }
    }
}
