//
//  PVPickerManger.swift
//  WPPhotoPicker
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit

public struct PVPickerManger {
    
    public static func showPVList(target: UIViewController, manger: PVManger) {
        let vc = PVListViewController()
        vc.manger = manger
        let nav = PVNavViewController(rootViewController: vc)
        target.present(nav, animated: true, completion: nil)
    }
}
