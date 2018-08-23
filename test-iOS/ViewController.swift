//
//  ViewController.swift
//  test-iOS
//
//  Created by R0uter on 8/23/18.
//  Copyright © 2018 R0uter. All rights reserved.
//

import UIKit
import SunPinyin_iOS
class ViewController: UIViewController {
    @IBOutlet weak var textView:UITextView!
    let pyWrapper = SunpinyinWrapper()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let d = Date()
        pyWrapper.en2eng = true;
        let s = pyWrapper.candidate(withBuffer: "huangshangwojiushidangniandaminghupandexiayuheya")
        textView.text = s
        textView.text += "\n\n\n"
        textView.text += "\(Date().timeIntervalSince(d)*1000)ms"
    }


}

