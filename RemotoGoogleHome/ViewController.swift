//
//  ViewController.swift
//  RemotoGoogleHome
//
//  Created by ShogoKitamura on 2018/03/18.
//  Copyright © 2018年 clapyourhouse labs. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var recordButton: UIButton!
    @IBAction func recordButtonTapped(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 録音開始を無効化する。
        recordButton.isEnabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    //viewWillAppearとかに書く
    override func viewWillAppear(_ animated: Bool) {
            SFSpeechRecognizer.requestAuthorization { (status) in
                OperationQueue.main.addOperation {
                    switch status {
                    case .authorized:   // 許可OK
                        self.recordButton.isEnabled = true
                        self.recordButton.backgroundColor = UIColor.blue
                    case .denied:       // 拒否
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("録音許可なし", for: .disabled)
                    case .restricted:   // 限定
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("このデバイスでは無効", for: .disabled)
                    case .notDetermined:// 不明
                        self.recordButton.isEnabled = false
                        self.recordButton.setTitle("録音機能が無効", for: .disabled)
                    }
                }
            }
    }
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

