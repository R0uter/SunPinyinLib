//
//  AppDelegate.swift
//  test-macOS
//
//  Created by R0uter on 8/22/18.
//  Copyright © 2018 R0uter. All rights reserved.
//

import Cocoa
import SunPinyinLib_macOS
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let pyWrapper = SunpinyinWrapper()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
  
        let d = Date()
        pyWrapper.en2eng = true;
        let s = pyWrapper.candidate(withBuffer: "huangshangwojiushidangniandaminghupandexiayuheya")
        print(s!)
        print(Date().timeIntervalSince(d)*1000,"ms")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

