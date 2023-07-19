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
//        var d = Date()
////        pyWrapper.en2eng = true;
////        pyWrapper.mg2ng = true
////        pyWrapper.an2ang = true
//        pyWrapper.updateFuzzConfig()
//        pyWrapper.updateAutoCorrection()
//        let s = "guo'wu'yuan'zong'li'zhu'rong'ji'shuo'cao'ni'ma"
//
        
//        let aaa = pyWrapper.pyString(from: "shilichangjiesongzonglifangangangahvhm") as! [String]
//        print(Date().timeIntervalSince(d)*1000,"ms")
//        print(aaa)

//        for c in s {
//
//            let result = pyWrapper.insert(withChar: String(c))
//            print(result)
//        }
//        let result = pyWrapper.candidate(withBuffer: s)
//        print(Date().timeIntervalSince(d)*1000,"ms")
//        print(pyWrapper.pyStringFromCurrentBuffer())
//        print(result)
        
        
        let data = getWordData()
        guard !data.isEmpty else {return}
        let allCount = data.count
        var hitCount = 0
        var currentCount = 0
        print("total:\(allCount)")
        for item in data {
            autoreleasepool {
                let result = pyWrapper.candidate(withBuffer: item.key)
                if result == item.value {
                    hitCount += 1
                }

                if (currentCount % 100) == 0 {
                    print("current progress: \(Int(Double(currentCount) / Double(allCount) * 100))%, count:\(currentCount)")
                    if result != item.value {
                        print("test:\(item.key), result:\(result ?? "NaN"), should:\(item.value)")
                    }
                }
                currentCount += 1
            }

        }
        print("命中率：", Double(hitCount)/Double(allCount)*100,"%")
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


