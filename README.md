# Mac QR Scanner

Scan QR codes on macOS without touching your phone.

A lightweight macOS QR code scanner built with Swift.  
Made out of frustration with constantly needing my phone just to scan QR codes while working on my computer.

## How it works

1. Take a screenshot (`CMD + Shift + 5`)
2. Select the region containing the QR code
3. Copy it
4. Paste into the app

Done.

## Features

- Paste screenshots or images to detect QR codes instantly  
- Fast, minimal, no distractions  
- Fully native macOS app  

## Coming Soon

- Scan directly using your Mac’s camera  
- Import and scan from image files  
- Detect multiple QR codes/barcodes from a single image  

## Motivation

Switching devices just to scan a QR code breaks focus and slows things down. This keeps everything on one screen.

## Tech Stack

- Swift  
- Vision / CoreImage (QR detection)  
- AVFoundation (camera — planned)

## Status

Work in progress — evolving into a full QR & barcode toolkit.

---

## Run Locally

```bash
git clone https://github.com/YOUR_USERNAME/MacQRScanner.git
