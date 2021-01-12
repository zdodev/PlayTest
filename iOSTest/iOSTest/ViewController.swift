//
//  ViewController.swift
//  iOSTest
//
//  Created by Zero DotOne on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            DispatchQueue.main.async {
                let view1 = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
                view1.backgroundColor = .black
                self.view.addSubview(view1)
            }
        }
    }
}

