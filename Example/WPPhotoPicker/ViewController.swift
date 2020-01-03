//
//  ViewController.swift
//  WPPhotoPicker
//
//  Created by WHeB on 01/03/2020.
//  Copyright (c) 2020 WHeB. All rights reserved.
//

import UIKit
import WPPhotoPicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 40)
        button.backgroundColor = UIColor.orange
        button.setTitle("选择", for: .normal)
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func action() {
        
        let manger = PVManger()
        manger.pvType = .photo
        PVPickerManger.showPVList(target: self, manger: manger)
    }
}

