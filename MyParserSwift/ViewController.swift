//
//  ViewController.swift
//  MyParserSwift
//
//  Created by 李世航 on 2019/6/25.
//  Copyright © 2019 李世航. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var beforeTextView: NSTextView!
    @IBOutlet var afterTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func conversionType(_ sender: Any) {
        runScript()
    }

    func runScript() {
        guard let aPath = Bundle.main.path(forResource: "pythonToJson", ofType: "py") else { return }

        let script = CocoaPython(scrPath: aPath, args: fetchArgs()) { [weak self] in
            self?.scriptFinish(results: $0, error: $1)
        }

        script.runAsync()
    }

    // 执行完成的回调
    func scriptFinish(results: [String], error: String?) {
        if let aError = error {
            afterTextView.string = "解析错误\r\n" + aError
            return
        }
        afterTextView.string = results[0]
    }

    func fetchArgs() -> [String] {
        var args = [beforeTextView.string]
        args.append("/Users/lishihang/Desktop/b.json")
        //        // mapper
        //        args.append(mapperCheck.state == .on ? "objectMapper" : "none")
        //
        //        // name
        //        let name = nameText.stringValue == "" ? "Result" : nameText.stringValue
        //        args.append(name)
        //
        //        // prefix
        //        args.append(prefixText.stringValue)

        return args
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

