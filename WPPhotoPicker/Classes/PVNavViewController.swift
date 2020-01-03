//
//  PVNavViewController.swift
//  WPPhotoPicker
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit

public class PVNavViewController: UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        setupAppearanceAtr()
    }
    
    private func setupAppearanceAtr() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.tintColor = UIColor.black
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]
        navigationBar.titleTextAttributes = attributes
    }
    
}
