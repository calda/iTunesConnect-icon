//
//  main.swift
//  iTunes Connect Icon
//
//  Created by Cal Stephens on 2/14/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import Foundation
import AppKit

/// 81304FA8435E454D058C17536C6528B4 seems to be a unique ID that corresponds to itunesconnect.apple.com
let iconPath = "~/Library/Safari/Touch Icons Cache/Images/81304FA8435E454D058C17536C6528B4.png"
let tildaExpandedPath = NSString(string: iconPath).expandingTildeInPath

// delete the existing icon (seems to be a 32x32 favicon)
if FileManager.default.isReadableFile(atPath: tildaExpandedPath) {
    try? FileManager.default.removeItem(at: URL.init(fileURLWithPath: tildaExpandedPath))
}

// download the apple-touch-logo
let logoUrl = URL(string: "https://github.com/calda/iTunesConnect-icon/raw/master/apple-touch-icon.png")!
let downloadSemaphore = DispatchSemaphore(value: 0)

let dataTask = URLSession.shared.dataTask(with: logoUrl) { data, _, error in
    defer {
        downloadSemaphore.signal() // let the script terminate
    }
    
    guard let imageData = data else {
        print("""
        Could not download apple-touch-logo.
        Error: \(error?.localizedDescription ?? "Unknown error")
        """)
        return
    }
    
    guard NSImage(data: imageData) != nil else {
        print("apple-touch-logo no longer exists at expected url (\(logoUrl)")
        return
    }
    
    do {
        try imageData.write(to: URL(fileURLWithPath: tildaExpandedPath))
        print("Done!\n")
        print("Restart Safari to reload the Touch Icon Cache.")
    } catch let error {
        print("""
        Could not save image to Safari Touch Icons Cache
        Error: \(error.localizedDescription)
        """)
    }
}

print("Downloading apple-touch-logo to Safari Touch Icons Cache....")
dataTask.resume()
downloadSemaphore.wait() // don't let the script terminate until the data task is finished
