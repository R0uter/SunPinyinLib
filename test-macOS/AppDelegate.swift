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
  
        
        pyWrapper.en2eng = true;
        let s = "huangshangwojiushidangniandaminghupandexiayuheya"
        for c in s {
            let d = Date()
            pyWrapper.insert(withChar: String(c))
            let result = pyWrapper.currentCandidate()
            print(result)
            print(Date().timeIntervalSince(d)*1000,"ms")
        }
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

