//
//  wordData.swift
//  test-macOS
//
//  Created by R0uter on 2/13/20.
//  Copyright © 2020 R0uter. All rights reserved.
//

import Foundation

func getWordData()->[String:String] {
    let data = try! Data(contentsOf: URL(fileURLWithPath: "/Users/r0uter/Git/SunPinyinLib/test-macOS/data.json"))
    if let a = try? JSONSerialization.jsonObject(with: data) as? [String:String] {
        return a
    }
    return [:]
}
func getLongWordData()->[String:String] {
    let data = try! Data(contentsOf: URL(fileURLWithPath: "/Users/r0uter/Git/SunPinyinLib/test-macOS/longWordData.json"))
    if let a = try! JSONSerialization.jsonObject(with: data) as? [String:String] {
        return a
    }
    return [:]
}
