//
//  UserData.swift
//  ShowColor
//
//  Created by Raysharp666 on 2020/3/31.
//  Copyright © 2020 LyongY. All rights reserved.
//

import Foundation
import AppKit
import Kanna

struct UserData {
    var data: [(String, NSColor)] {
        var colorArr: [(String, NSColor)] = []
        guard let path = Bundle.main.path(forResource: "colors", ofType: "xml"), let doc = try? Kanna.XML(url: URL(fileURLWithPath: path), encoding: .utf8) else {
            return colorArr
        }
        let colorElement = doc.xpath("//color")
        for item in colorElement {
            if let key = item["name"],
                let value = item.text
            {
                let hexString = value.replacingOccurrences(of: "#", with: "")
                var rgb: UInt64 = 0
                Scanner(string: hexString).scanHexInt64(&rgb)
                
                let color = NSColor(calibratedRed: CGFloat(Double((rgb & 0xFF0000) >> 16) / 255.0),
                                                           green: CGFloat(Double((rgb & 0xFF00) >> 8) / 255.0),
                                                           blue: CGFloat(Double((rgb & 0xFF) >> 0) / 255.0),
                                                           alpha: 1)
                colorArr.append((key, color))
            }
        }
        return colorArr
    }
}
